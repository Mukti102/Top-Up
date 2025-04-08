<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Outerweb\Settings\Models\Setting;

class NewsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $news = News::all();
        return Inertia::render("News", ["news" => $news]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
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
        $news = News::where("title", $id)->first();
        $tags = $news->tags;
        $related = News::where("id", "!=", $news->id)
            ->whereJsonContains("tags", $tags[0]) // Ambil satu tag sebagai acuan
            ->take(5)
            ->get();
        return Inertia::render("NewsDetail", ["news" => $news, "related" => $related]);
    }

    public function tag($tag)
    {
        $news = News::whereJsonContains("tags", $tag)->latest()->get();
        return Inertia::render("TagsNews", ["news" => $news, 'tag' => $tag]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
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

    public function terms()
    {
        $term  = Setting::where("key", "syarat_dan_ketentuan")->first();
        return Inertia::render("Terms", ["terms" => $term]);
    }
}
