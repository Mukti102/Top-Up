<?php

namespace App\Http\Controllers;

use App\Models\BrandProduct;
use App\Models\Product;
use Illuminate\Http\Request;

class apiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function brands(Request $request)
    {
        $query = BrandProduct::query();

        // Filter by name if provided
        if ($request->has('search')) { // Change 'name' to 'search' to match frontend
            $query->where('name', 'LIKE', '%' . $request->search . '%');
        }

        $brands = $query->with('category')->get();

        return response()->json($brands);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
