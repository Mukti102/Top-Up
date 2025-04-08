<?php

namespace App\Http\Controllers;

use App\Helpers\TemplateWhatsappHelper;
use App\Models\Transaction;
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

        // Logging untuk debugging
        Log::info("Received Headers:", $request->headers->all());
        Log::info("Received Payload:", json_decode($post_data, true));
        Log::info("Computed Signature:", ['signature' => $computed_signature]);
        Log::info("Received Signature:", ['signature' => $received_signature]);

        // Perbandingan Signature
        if ($received_signature === $computed_signature) {
            Log::info(json_decode($request->getContent(), true));
            Log::info("✅ Webhook Verified!");


            $content = json_decode($request->getContent());
            $ref_id = $content->data;
            $transaction  = Transaction::where('reference_number', $ref_id)->first();

            // update to succes 
            $transaction->update(['status' => 'success']);

            TemplateWhatsappHelper::userOrderDoneMessage($transaction);

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
