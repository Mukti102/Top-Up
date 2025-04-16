<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Http;

class SendWa implements ShouldQueue
{
    use Dispatchable, Queueable, SerializesModels;

    protected $phone;
    protected $message;
    /**
     * Create a new job instance.
     */
    public function __construct($phone, $message)
    {
        $this->phone = $phone;
        $this->message = $message;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $response = Http::asForm()->withHeaders([
            'Authorization' => env('WHATSAPP_TOKEN') // Ganti dengan token Fonnte kamu
        ])->post('https://api.fonnte.com/send', [
            'target' => $this->phone,
            'message' => $this->message,
            'countryCode' => '62',
        ]);


        if ($response->failed()) {
            throw new \Exception('Gagal mengirim pesan ke whatsapp');
        }
    }
}
