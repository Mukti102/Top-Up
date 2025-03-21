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
        Schema::create('field_inputs', function (Blueprint $table) {
            $table->id();
            $table->string('seperator')->nullable();
            $table->string('placeholder')->nullable();
            $table->string('label');
            $table->enum('type_status', ['text', 'select'])->default('text');
            $table->json('options')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('field_inputs');
    }
};
