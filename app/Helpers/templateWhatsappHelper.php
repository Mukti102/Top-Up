<?php

namespace App\Helpers;

use App\Events\UserLogged;
use App\Jobs\SendWa;
use App\Models\User;
use App\Models\WhatsappTemplate;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class TemplateWhatsappHelper
{
    public static function adminMessageAfterUserSuccessPayment($transaction)
    {
        $admin = User::where('role_id', '1')->get();
        $template = WhatsappTemplate::where('name', "Template Untuk Admin Ketika User berhasil melakukan pembayaran")->first();
        if ($template) {
            $message = str_replace(
                ['[TOTAL]', '[NO_INVOICE]', '[NAME]', '[PAYMENT_METHOD]', '[DATE]'],
                [
                    number_format(ceil($transaction->price), 0, ',', '.'), // Format harga rupiah
                    $transaction->reference_number,
                    $transaction->user_id ? $transaction->user->name : "GUEST",
                    $transaction->paymentMethod->name ?? "Tidak Diketahui", // Cegah error jika tidak ada metode pembayaran
                    $transaction->processed_at
                ],
                $template->message
            );
            try {
                // kirim ke semua admin
                foreach ($admin as $a) {
                    SendWa::dispatch($a->phone, $message);
                }
            } catch (\Exception $e) {
                Log::error("Gagal Mengirim Pesan Untuk Admin", ['exception' => $e]);
                event(new UserLogged(Auth::check() ? Auth::user()->name : "GUEST", 'Gagal Mengirim Pesan Untuk Admin: ' . $e->getMessage()));
            }
        } else {
            Log::error("Template Untuk Admin Ketika User berhasil melakukan pembayaran Tidak Ditemukan");
        }
    }

    public static function userTransactionMessage($transaction, $expiredTime)
    {
        $template = WhatsappTemplate::where('name', "Template Pesan Pesanan Berhasil di Buat")->first();
        $expiredTime = date('Y-m-d H:i:s', $expiredTime);

        if ($template) {
            $productName = $transaction->product->name ?? 'Deposit'; // Handle null product

            $message = str_replace(
                ['[NAME]', "[TOTAL]", '[PRODUCT]', '[TANGGAL_EXPIRED]', '[NO_INVOICE]', "[PAYMENT_METHOD]"],
                [
                    Auth::check() ? Auth::user()->name : 'GUEST',
                    number_format(ceil($transaction->price), 0, ',', '.'),
                    $productName,
                    $expiredTime,
                    $transaction->reference_number,
                    $transaction->paymentMethod->name
                ],
                $template->message
            );

            try {
                SendWa::dispatch($transaction->phone, $message);
            } catch (\Exception $e) {
                Log::error("Gagal Mengirim Pesan Untuk User", ['exception' => $e]);
                event(new UserLogged(Auth::check() ? Auth::user()->name : "GUEST", 'Gagal Mengirim Pesan Untuk User: ' . $e->getMessage()));
            }
        } else {
            Log::error("Template Pesan Pesanan Berhasil di Buat Tidak Ditemukan");
        }
    }

    public static function userSuccessPaymentMessage($transaction)
    {
        $template = WhatsappTemplate::where('name', "Template Pesan Pesanan Berhasil di Bayar")->first();

        if ($template) {
            $message = str_replace(
                ['[NAME]', '[NO_INVOICE]'],
                [
                    Auth::check() ? Auth::user()->name : "GUEST",
                    $transaction->reference_number
                ],
                $template->message
            );

            try {
                SendWa::dispatch($transaction->phone, $message);
            } catch (\Exception $e) {
                Log::error("Gagal Mengirim Pesan Pembayaran Sukses", ['exception' => $e]);
                event(new UserLogged(Auth::check() ? Auth::user()->name : "GUEST", 'Gagal Mengirim Pesan Pembayaran Sukses: ' . $e->getMessage()));
            }
        } else {
            Log::error("Template Pesan Pesanan Berhasil di Bayar Tidak Ditemukan");
        }
    }

    public static function userOrderDoneMessage($transaction)
    {
        $template = WhatsappTemplate::where('name', 'Template Pesan Pesanan Berhasil & Selesai')->first();

        if ($template) {
            $message = str_replace(
                ['[NO_INVOICE]', "[NAME_CUSTOMER", "[PAYMENT_METHODE]"], // Perbaikan placeholder
                [$transaction->reference_number],
                $template->message,
                $transaction->user_id ? $transaction->user->name : "GUEST",
                $transaction->paymentMethod->name
            );
            try {
                SendWa::dispatch($transaction->phone, $message);
            } catch (\Exception $e) {
                Log::error("Gagal Mengirim Pesan Pesanan Selesai", ['exception' => $e]);
                event(new UserLogged(Auth::check() ? Auth::user()->name : "GUEST", 'Gagal Mengirim Pesan Pesanan Selesai: ' . $e->getMessage()));
            }
        } else {
            Log::error("Template Pesan Pesanan Berhasil & Selesai Tidak Ditemukan");
        }
    }

    public static function messageOTPVerification($phone, $otp)
    {
        $template = WhatsappTemplate::where('name', 'OTP Register')->first();
        if ($template) {
            $message = str_replace(
                ["[OTP]"],
                $otp,
                $template->message
            );
            try {
                SendWa::dispatch($phone, $message);
            } catch (\Exception $e) {
                Log::error("Gagal Mengirim Pesan OTP Verifikasi", ['exception' => $e]);
                event(new UserLogged(Auth::check() ? Auth::user()->name : "GUEST", 'Gagal Mengirim Pesan OTP Verifikasi: ' . $e->getMessage()));
            }
        }
    }
    public static function messageOTPForgotPassword($phone, $otp)
    {
        $template = WhatsappTemplate::where('name', 'OTP Lupa Password')->first();
        if ($template) {
            $message = str_replace(
                ["[OTP]"],
                $otp,
                $template->message
            );
            try {
                SendWa::dispatch($phone, $message);
            } catch (\Exception $e) {
                Log::error("Gagal Mengirim Pesan OTP Lupa Password", ['exception' => $e]);
                event(new UserLogged(Auth::check() ? Auth::user()->name : "GUEST", 'Gagal Mengirim Pesan OTP Lupa Password: ' . $e->getMessage()));
            }
        }
    }
}
