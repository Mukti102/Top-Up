<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use App\Models\WhatsappTemplate;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();
        Role::created([
            'name' => 'admin',
        ]);
        Role::created([
            'name' => 'user',
        ]);

        User::factory()->create([
            'name' => 'Test User',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('password'),
            'role_id' => 1
        ]);

        //   admin
        WhatsappTemplate::create([
            'name' => "Template Untuk Admin Ketika User Baru membuat Transaksi",
            "message" => "*",
            "parameters" => json_encode([
                "name" => "[NAME]",
                "phone" => "[PHONE]",
                "no_invoice" => "[NO_INVOICE]",
                "total" => "[TOTAL]",
                "brand" => "[BRAND]",
                "product" => "[PRODUCT]",
            ]),
            'role_id' => 1
        ]);

        // user pembeli
        WhatsappTemplate::create([
            'name' => "Template Pesan Verifikasi OTP*",
            "message" => "*",
            "parameters" => json_encode([
                "kode_otp" => "[OTP]",
            ]),
            'role_id' => 2
        ]);
        WhatsappTemplate::create([
            'name' => "Template Pesan Verifikasi OTP Perubahan Password",
            "message" => "*",
            "parameters" => json_encode([
                "kode_otp" => "[OTP]",
            ]),
            'role_id' => 2
        ]);
        WhatsappTemplate::create([
            'name' => "Template Pesan Pesanan Berhasil di Buat",
            "message" => "*",
            "parameters" => json_encode([
                "no_invoice" => "[NO_INVOICE]",
                "total" => "[TOTAL]",
                "product" => "[PRODUCT]",
                "tanggal_expired" => "[TANGGAL_EXPIRED]",
            ]),
            'role_id' => 2
        ]);
        WhatsappTemplate::create([
            'name' => "Template Pesan Pesanan Berhasil di Bayar",
            "message" => "*",
            "parameters" => json_encode([
                'no_invoice' => '[NO_INVOICE]',
            ]),
            'role_id' => 2
        ]);
        WhatsappTemplate::create([
            'name' => "Template Pesan Pesanan Berhasil & Selesai",
            "message" => "*",
            "parameters" => json_encode([
                "no_invoice" => "[NO_INVOICE]",
            ]),
            'role_id' => 2
        ]);

        WhatsappTemplate::create([
            'name' => "OTP Register",
            "message" => "*",
            "parameters" => json_encode([
                "nomor_otp" => "OTP",
            ]),
            'role_id' => 2,
        ]);

        WhatsappTemplate::create([
            'name' => "OTP Lupa Password",
            "message" => "*",
            "parameters" => json_encode([
                "nomor_otp" => "OTP",
            ]),
            'role_id' => 2,
        ]);
    }
}
