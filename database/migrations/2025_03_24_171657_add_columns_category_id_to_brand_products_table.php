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
        if (Schema::hasColumn('brand_products', 'category_id')) {
            Schema::table('brand_products', function (Blueprint $table) {
                $table->dropForeign(['category_id']);
                $table->dropColumn('category_id');
            });
        };
        Schema::table('brand_products', function (Blueprint $table) {
            $table->foreignId('category_id')->nullable()->constrained('categories', 'id')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('brand_products', function (Blueprint $table) {
            $table->dropForeign(['category_id']);
        });
    }
};
