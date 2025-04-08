<?php

namespace App\Service;

use App\Helpers\TemplateWhatsappHelper;
use App\Jobs\SendOtpToWa;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

class OTPService
{
    public static function sendOtp($phone)
    {
        $otp = rand(10000, 999999);
        // simapne otp selama 5 menit
        Cache::put('otp_' . $phone, $otp, now()->addMinute(5));

        // send to whatsapp
        TemplateWhatsappHelper::messageOTPVerification($phone, $otp);


        return true;
    }
    public static function sendOtpForgotPassword($phone)
    {
        $otp = rand(10000, 999999);
        // simapne otp selama 5 menit
        Cache::put('otp_' . $phone, $otp, now()->addMinute(5));

        // send to whatsapp
        TemplateWhatsappHelper::messageOTPForgotPassword($phone, $otp);


        return true;
    }

    public static function generateToken($phone)
    {
        $token = Str::random(32); // Token unik
        Cache::put('otp_token_' . $token, $phone, now()->addMinutes(10)); // Simpan token selama 10 menit
        return $token;
    }

    public static function verifyOtpForgotPassword($phone, $otp)
    {
        return Cache::get('otp_' . $phone) == $otp;
    }

    public static function verifyOTP($phone, $otp)
    {
        return Cache::get('otp_' . $phone) == $otp;
    }
}
