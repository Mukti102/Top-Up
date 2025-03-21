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
        Schema::dropIfExists('payment_methods');
        Schema::create('payment_methods', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique();
            $table->string('name');
            $table->string('type');
            $table->decimal('fee_percentage', 8, 2)->default(0);
            $table->decimal('fee_fixed', 10, 2)->default(0);
            $table->decimal('minimum_amount', 12, 2)->default(0);
            $table->decimal('maximum_amount', 12, 2)->default(0);
            $table->string('img_url')->nullable();
            $table->string('img')->nullable();
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->string('timing')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_methods');
    }
};
