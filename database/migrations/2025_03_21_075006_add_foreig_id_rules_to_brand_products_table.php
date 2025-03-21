<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('brand_products', function (Blueprint $table) {
            // Cek apakah foreign key ada sebelum menghapus
            $foreignKeys = DB::select("SELECT CONSTRAINT_NAME 
                                        FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
                                        WHERE TABLE_NAME = 'brand_products' 
                                        AND COLUMN_NAME = 'rules_brands_id' 
                                        AND CONSTRAINT_NAME <> 'PRIMARY'");

            if (!empty($foreignKeys)) {
                // Hapus foreign key terlebih dahulu
                $table->dropForeign([$foreignKeys[0]->CONSTRAINT_NAME]);
            }

            // Hapus kolom setelah foreign key dihapus
            if (Schema::hasColumn('brand_products', 'rules_brands_id')) {
                $table->dropColumn('rules_brands_id');
            }
        });

        // Tambahkan ulang foreign key dengan nullable
        Schema::table('brand_products', function (Blueprint $table) {
            $table->foreignId('rules_brands_id')->nullable()->constrained('rules_brands')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('brand_products', function (Blueprint $table) {
            if (Schema::hasColumn('brand_products', 'rules_brands_id')) {
                $table->dropForeign(['rules_brands_id']);
                $table->dropColumn('rules_brands_id');
            }
        });
    }
};
