<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Inertia\Response;

class ProfileController extends Controller
{

    public function index()
    {
        return Inertia::render('Auth/Profile');
    }

    public function update(Request $request)
    {
        try {
            $user = Auth::user();

            $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'phone' => ['required', 'string', 'max:255'],
                'password' => ['required', 'string', 'min:8'], // Tidak wajib
                'new_password' => ['nullable', 'string', 'min:8'], // Hanya jika user mengganti password
            ], [
                'min' => 'Minimal :min karakter.',
                'confirmed' => 'Password tidak cocok.',
                'max' => 'Maksimal :max karakter.',
            ]);

            // Jika user ingin mengubah password, pastikan password lama benar
            if ($request->password && !Hash::check($request->password, $user->password)) {
                return back()->with([
                    'status' => 'error',
                    'message' => 'Password lama tidak cocok.',
                ]);
            }

            $user->update([
                'name' => $request->name,
                'phone' => $request->phone,
                'password' => $request->new_password ? Hash::make($request->new_password) : $user->password,

            ]);


            return redirect('/profile')->with([
                'status' => 'success',
                'message' => 'Profil berhasil diperbarui.',
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return back()->with([
                'status' => 'error',
                'message' => $e->validator->errors()->first(),
            ]);
        } catch (\Exception $e) {

            return back()->with([
                'status' => 'error',
                'message' => $e->getMessage(),
            ]);
        }
    }
}
