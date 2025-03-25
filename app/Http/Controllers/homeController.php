<?php

namespace App\Http\Controllers;

use App\Models\BrandProduct;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class homeController extends Controller
{
    public function index()
    {
        $BrandProduct = BrandProduct::with('category')->get();
        $CategoryProduct = Category::with('brands')->get();
        return Inertia::render('Home', [
            'BrandProduct' => $BrandProduct,
            'Categories' => $CategoryProduct
        ]);
    }

    public function show($slug)
    {
        $BrandProduct = BrandProduct::where('slug', $slug)->first();
        $products = Product::where('brand_product_id', $BrandProduct->id)->get();
        return Inertia::render('Show', [
            'BrandProduct' => $BrandProduct,
            'products' => $products
        ]);
    }
}
