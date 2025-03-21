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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug');
            $table->string('sku_code');
            $table->foreignId('type_product_id')->constrained()->onDelete('cascade');
            $table->foreignId('brand_product_id')->constrained()->onDelete('cascade');
            $table->foreignId('category_id')->constrained()->onDelete('cascade');
            $table->text('description')->nullable();
            $table->string('seller_name');
            $table->decimal('base_price'); // Harga awal produk dari digiflazz
            $table->decimal('premium_price'); // Harga premium bagi membership
            $table->decimal('selling_price'); // Harga jual untuk pelanggan
            $table->decimal('admin_fee'); // biaya admin digiflazz + tripay
            $table->decimal('total_price'); // total harga (seeling proce + admin fee)
            $table->integer('reward_points')->default(0);   // Koin reward yang didapatkan dari pembelian produk
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->integer('stock')->default(0);
            $table->integer('price')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
