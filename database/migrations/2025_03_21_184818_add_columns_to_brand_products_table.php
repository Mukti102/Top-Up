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
        // jika ada colum provider tidak perlu di tambahkan
        if (Schema::hasColumn('brand_products', 'provider')) {
            return;
        }

        Schema::table('brand_products', function (Blueprint $table) {
            $table->string('provider')->nullable();
            $table->string('image')->nullable();
            $table->text('description')->nullable();
            $table->text('seo_description')->nullable();
            $table->foreignId('rules_brands_id')->nullable()->constrained('rules_brands', 'id')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('brand_products', function (Blueprint $table) {
            //
        });
    }
};
