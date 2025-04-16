<?php

namespace App\Observers;

use App\Models\ProductGroup;
use Illuminate\Support\Facades\Storage;

class ProductGroupObserver
{
    /**
     * Handle the ProductGroup "created" event.
     */
    public function created(ProductGroup $ProductGroup): void
    {
        //
    }

    /**
     * Handle the ProductGroup "updated" event.
     */
    public function updated(ProductGroup $ProductGroup): void
    {
        if ($ProductGroup->isDirty("image")) {
            $oldFile = $ProductGroup->getOriginal('image');
            if ($oldFile && Storage::disk('public')->exists($oldFile)) {
                Storage::disk('public')->delete($oldFile);
            }
        }
    }

    /**
     * Handle the ProductGroup "deleted" event.
     */
    public function deleted(ProductGroup $ProductGroup): void
    {
        if ($ProductGroup->image && Storage::disk('public')->exists($ProductGroup->image)) {
            Storage::disk('public')->delete($ProductGroup->image);
        }
    }

    /**
     * Handle the ProductGroup "restored" event.
     */
    public function restored(ProductGroup $ProductGroup): void
    {
        //
    }

    /**
     * Handle the ProductGroup "force deleted" event.
     */
    public function forceDeleted(ProductGroup $ProductGroup): void
    {
        //
    }
}
