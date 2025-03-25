<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class digiflazzController extends Controller
{
    public function webhook(Request $request)
    {
        $secret = 'somesecretvalue'; // Ganti dengan secret yang benar

        $post_data = file_get_contents('php://input');
        $computed_signature = 'sha1=' . hash_hmac('sha1', $post_data, $secret);
        $received_signature = $request->header('X-Hub-Signature');

        dd($received_signature);
        // Logging untuk debugging
        Log::info("Received Headers:", $request->headers->all());
        Log::info("Received Payload:", json_decode($post_data, true));
        Log::info("Computed Signature:", ['signature' => $computed_signature]);
        Log::info("Received Signature:", ['signature' => $received_signature]);

        // Perbandingan Signature
        if ($received_signature === $computed_signature) {
            Log::info("✅ Webhook Verified!");

            return response()->json(['message' => 'Webhook received'], 200);
        } else {
            Log::error("❌ Invalid Signature!", [
                'computed' => $computed_signature,
                'received' => $received_signature,
            ]);
            return response()->json(['message' => 'Invalid Signature'], 403);
        }
    }
}
