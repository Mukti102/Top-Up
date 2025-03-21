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
        // drop froignId In RulesBrands
        Schema::table('rules_brands', function (Blueprint $table) {
            $table->dropForeign(['field_input_id']);
            $table->dropColumn('field_input_id');
        });

        Schema::table('field_inputs', function (Blueprint $table) {
            $table->foreignId('rules_brands_id')->constrained('rules_brands', 'id')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('field_inputs', function (Blueprint $table) {
            $table->dropForeign(['rules_brands_id']);
            $table->dropColumn('rules_brands_id');
        });
    }
};
