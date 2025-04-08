<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class SendOtpToWa implements ShouldQueue
{
    use Dispatchable, Queueable, SerializesModels;

    protected $phone;
    protected $otp;
    /**
     * Create a new job instance.
     */
    public function __construct($phone, $otp)
    {
        $this->phone = $phone;
        $this->otp = $otp;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $response = Http::asForm()->withHeaders([
            'Authorization' => 'GJu2qM8YKF47K8PC1b3u' // Ganti dengan token Fonnte kamu
        ])->post('https://api.fonnte.com/send', [
            'target' => $this->phone,
            'message' => "Kode OTP Anda: {$this->otp}",
            'countryCode' => '62',
        ]);


        if ($response->failed()) {
            throw new \Exception('Gagal mengirim OTP ke WhatsApp');
        }
    }
}
