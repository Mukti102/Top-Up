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
        Schema::table('brand_products', function (Blueprint $table) {
            $table->boolean('isRecommended')->default(false);
            $table->boolean('isPopular')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('brand_products', function (Blueprint $table) {
            $table->dropColumn('isRecommended');
            $table->dropColumn('isPopular');
        });
    }
};
