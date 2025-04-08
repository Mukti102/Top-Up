<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Service\OTPService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class AuthController extends Controller
{
    public function login()
    {
        return Inertia::render('Auth/Login');
    }

    public function loginPost(Request $request)
    {
        $request->validate([
            'phone' => 'required',
            'password' => 'required',
        ], [
            'phone.required' => 'Nomor telepon harus diisi.',
            'password.required' => 'Password harus diisi.',
        ]);

        if (!Auth::attempt($request->only('phone', 'password'), $request->boolean('remember'))) {
            return back()->withErrors([
                'message' => 'Nomor telepon atau password salah.', // Pesan error umum
            ]);
        }

        return redirect()->intended('/');
    }


    public function register()
    {
        return Inertia::render('Auth/Register');
    }

    public function registerPost(Request $request)
    {

        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'phone' => 'required|unique:users,phone',
            'password' => 'required|min:6|confirmed',
        ], [
            'phone.unique' => 'Nomor telepon sudah terdaftar.',
            'email.unique' => 'Email sudah terdaftar.',
            'password.confirmed' => 'Password tidak cocok.',
            'max' => 'Maksimal :max karakter.',
            'min' => 'Minimal :min karakter.',
        ]);

        OTPService::sendOtp($data['phone']);

        // sipanm sementara data 
        session(['register_data' => $data]);

        // page otp
        return redirect('/verify/otp');
    }

    public function otpPage()
    {
        return Inertia::render('Auth/Otp');
    }

    public function verifyOtp(Request $request)
    {
        $request->validate([
            'otp' => 'required|numeric',
        ]);

        $data = session('register_data');
        if (!$data) {
            return redirect('/register')->withErrors(['error' => 'Session expired, please register again.']);
        }

        if (!OTPService::verifyOTP($data['phone'], $request->otp)) {
            return back()->withErrors(['otp' => 'Invalid OTP, please try again.']);
        }

        // Simpan user ke database setelah OTP valid
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'password' => Hash::make($data['password']),
            'role_id' => 2
        ]);

        session()->forget('register_data'); // Hapus session

        return redirect()->intended('/login')->with(['message' => "Selamat Kamu Sudah Terdaftar"]);
    }
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route("home");
    }

    public function forgotPage()
    {
        return Inertia::render('Auth/Forgot');
    }

    public function forgotPost(Request $request)
    {
        $user = User::where('phone', $request->phone)->first();

        if (!$user) {
            return back()->withErrors(['phone' => 'Nomor telepon tidak terdaftar.']);
        }

        // Kirim OTP
        OTPService::sendOtpForgotPassword($user->phone);

        // Buat token reset
        $token = OTPService::generateToken($user->phone);

        // handle jika user meminta kirim otp lagi

        return redirect('/forgot-password/' . $token)->with('success', 'OTP telah dikirim kembali!');;
    }

    public function  otpPasswordPage($token)
    {
        // Ambil nomor telepon berdasarkan token
        $phone = Cache::get('otp_token_' . $token);

        if (!$phone) {
            return redirect('/forgot-password')->withErrors(['error' => 'Token tidak valid atau telah kadaluarsa.']);
        }

        return Inertia::render('Auth/OtpForgotPassword', ['phone' => $phone]);
    }

    public function verifyOtpPassword(Request $request)
    {
        $request->validate([
            'otp' => 'required|numeric',
            'phone' => 'required'
        ]);


        if (!OTPService::verifyOtpForgotPassword($request->phone, $request->otp)) {
            return back()->withErrors(['otp' => 'Invalid OTP, please try again.']);
        }

        $token = OTPService::generateToken($request->phone);

        return redirect('/reset-password/' . $token);
    }



    public function resetPage($token)
    {
        $phone = Cache::get('otp_token_' . $token);
        return Inertia::render('Auth/Reset', ['phone' => $phone]);
    }

    public function resetPost(Request $request)
    {
        $request->validate([
            'password' => 'required|min:6|confirmed',
            'phone' => "required"
        ], [
            'min' => 'Minimal :min karakter.',
            'confirmed' => 'Password tidak cocok.'
        ]);

        $user = User::where('phone', $request->phone)->first();

        $user->password = Hash::make($request->password);
        $user->save();

        // hapus token
        Cache::forget('otp_token_' . $request->token);

        return redirect()->route('login')->with('message', 'Password berhasil diubah!');
    }
}
