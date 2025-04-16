<?php

namespace App\Observers;

use App\Models\BrandProduct;
use Illuminate\Support\Facades\Storage;

class BrandProductObserver
{
    /**
     * Handle the BrandProduct "created" event.
     */
    public function created(BrandProduct $brandProduct): void
    {
        //
    }

    /**
     * Handle the BrandProduct "updated" event.
     */
    public function updated(BrandProduct $brandProduct): void
    {
        $fileFields = ['background_image', 'image'];

        foreach ($fileFields as $field) {
            if ($brandProduct->isDirty($field)) {
                $oldFile = $brandProduct->getOriginal($field);
                if ($oldFile && Storage::disk('public')->exists($oldFile)) {
                    Storage::disk('public')->delete($oldFile);
                }
            }
        }
    }


    /**
     * Handle the BrandProduct "deleted" event.
     */
    public function deleted(BrandProduct $brandProduct): void
    {
        //
    }

    /**
     * Handle the BrandProduct "restored" event.
     */
    public function restored(BrandProduct $brandProduct): void
    {
        //
    }

    /**
     * Handle the BrandProduct "force deleted" event.
     */
    public function forceDeleted(BrandProduct $brandProduct): void
    {
        //
    }
}
