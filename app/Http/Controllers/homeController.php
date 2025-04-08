<?php

namespace App\Http\Controllers;

use App\Models\BrandProduct;
use App\Models\Category;
use App\Models\Kupon;
use App\Models\PaymentMethod;
use App\Models\Product;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Crypt;
use Inertia\Inertia;
use Outerweb\Settings\Models\Setting;

class homeController extends Controller
{
    public function index()
    {
        $BrandProduct = BrandProduct::with('category')->get();
        $CategoryProduct = Category::with('brands')->get();
        // ambil key seo.title,seo.description,slider,theme,general.brand.favicon,general.brand.logo
        return Inertia::render('Home', [
            'BrandProduct' => $BrandProduct,
            'Categories' => $CategoryProduct,
        ]);
    }

    public function show($slug)
    {

        $BrandProduct = BrandProduct::with('paymentMethods', 'rules.fieldInput', 'category')->where('slug', $slug)->first();
        $products = Product::with('brand', 'category', 'type', 'group')->where('brand_product_id', $BrandProduct->id)->get();
        $paymentMethods = PaymentMethod::with('brands')->get();
        return Inertia::render('Show', [
            'BrandProduct' => $BrandProduct,
            'products' => $products,
            'paymentMethods' => $paymentMethods
        ]);
    }

    public function cekTrans()
    {
        $transactions = Transaction::query()
            ->when(Auth::check(), function ($query) {
                $query->where('user_id', Auth::id());
            })
            ->latest()
            ->limit(10)
            ->get();

        return Inertia::render('CekTransaksi', [
            'transactions' => $transactions
        ]);
    }


    public function detailTrans(Request $request)
    {
        $id = $request->input('id');
        $id = Crypt::encrypt($id);
        return redirect()->route('transaction.detail', ['id' => urlencode($id)]);
    }

    public function cekTransApi(Request $request)
    {
        $transactions = Transaction::where('reference_number', $request->input('reference_number'))->first();

        if (!$transactions) {
            return response()->json(['message' => 'Transaksi tidak ditemukan'], 404);
        }

        return response()->json($transactions);
    }


    public function priceList()
    {
        $categories = Category::with('brands')->get();
        $products = Product::with('brand', 'category', 'type')->get();
        return Inertia::render('PriceList', [
            'categories' => $categories,
            'products' => $products
        ]);
    }

    public function getDiskon(Request $request)
    {
        $kupon = Kupon::where('code', $request->code)->first();
        if (!$kupon) {
            return response()->json(['message' => 'Kode tidak valid'], 404);
        }
        return response()->json($kupon);
    }

    public function about()
    {
        return Inertia::render('About');
    }
}
