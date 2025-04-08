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
        Schema::create('general_models', function (Blueprint $table) {
            $table->id();
            $table->string('site_name');
            $table->string('site_description');
            $table->string('site_owner');
            $table->string('site_logo');
            $table->json('site_keywords')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('general_models');
    }
};
