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
        Schema::table('user_logs', function (Blueprint $table) {
            // Hapus foreign key constraint terlebih dahulu
            $table->dropForeign(['user_id']);

            // Ubah user_id menjadi nullable
            $table->foreignId('user_id')->nullable()->change();

            // Tambahkan kembali foreign key constraint
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('user_logs', function (Blueprint $table) {
            // Hapus foreign key constraint
            $table->dropForeign(['user_id']);

            // Ubah kembali user_id menjadi NOT NULL
            $table->foreignId('user_id')->nullable(false)->change();

            // Tambahkan kembali foreign key constraint
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }
};
