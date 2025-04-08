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
        // Ensure that the 'level' column is an enum and set its default to 'basic'
        Schema::table('users', function (Blueprint $table) {
            $table->enum('level', ['basic', 'premium'])->default('basic')->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Revert the 'level' column to its original state, you may want to change it back to string or another type
        Schema::table('users', function (Blueprint $table) {
            $table->string('level')->default('basic')->change();  // Adjust this if the column had a different type
        });
    }
};
