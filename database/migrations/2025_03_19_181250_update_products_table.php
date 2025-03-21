<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->decimal('base_price', 15, 2)->change();
            $table->decimal('premium_price', 15, 2)->change();
            $table->decimal('selling_price', 15, 2)->change();
            $table->decimal('admin_fee', 15, 2)->change();
            $table->decimal('total_price', 15, 2)->change();
            $table->decimal('benefit', 15, 2)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->decimal('base_price', 15, 2)->change();
            $table->decimal('premium_price', 15, 2)->change();
            $table->decimal('selling_price', 15, 2)->change();
            $table->decimal('admin_fee', 15, 2)->change();
            $table->decimal('total_price', 15, 2)->change();
            $table->decimal('benefit', 15, 2)->change();
        });
    }
};
