<?php

use App\Helpers\ApiGames;
use App\Helpers\TripayHelper;
use App\Http\Controllers\apiController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\depositController;
use App\Http\Controllers\digiflazzController;
use App\Http\Controllers\homeController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\payment\transactionController;
use App\Http\Controllers\ProfileController;
use Filament\Facades\Filament;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


// ====================== FRONTEND ROUTES ======================
Route::get('/', [homeController::class, 'index'])->name('home');
Route::get('/order/{slug}', [homeController::class, 'show'])->name('show');
Route::get('/transaction/{id}', [transactionController::class, 'detail'])->name('transaction.detail');
Route::get('/cek/transaksi', [homeController::class, 'cekTrans'])->name('cek.transaction');
Route::post('/detail/transaksi', [homeController::class, 'detailTrans'])->name('get.detail.transaction');
Route::get('/pricelist', [homeController::class, 'pricelist'])->name('pricelist');
Route::get('/about', [homeController::class, 'about'])->name('about');
Route::post('/getDiskon', [homeController::class, 'getDiskon'])->name('get.diskon');

// News & Terms
Route::resource("/news", NewsController::class);
Route::get("/tags/{tag}", [NewsController::class, 'tag'])->name('news.tag');
Route::get("/terms", [NewsController::class, 'terms'])->name('terms');

// ====================== AUTH & PROFILE ======================
Route::middleware(['auth'])->group(function () {
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/deposit', [depositController::class, 'index'])->name('deposit');
    Route::post('/deposit', [depositController::class, 'deposit'])->name('deposit.post');
    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
});

// Login / Register
Route::get('/login', [AuthController::class, 'login'])->name('login');
Route::post('/login', [AuthController::class, 'loginPost'])->name('login.post');
Route::get('/register', [AuthController::class, 'register'])->name('register.page');
Route::post('/register', [AuthController::class, 'registerPost'])->name('register.post');

// OTP & Reset Password
Route::get('/verify/otp', [AuthController::class, 'otpPage'])->name('otp.page');
Route::post('/verifiy/otp', [AuthController::class, 'verifyOtp'])->name('verify.otp');
Route::get('/forgot-password', [AuthController::class, 'forgotPage'])->name('forgot.page');
Route::post('/forgot-password', [AuthController::class, 'forgotPost'])->name('forgot.post');
Route::get('/forgot-password/{token}', [AuthController::class, 'otpPasswordPage'])->name('otp.forgot.page');
Route::post('/verify/otp-password', [AuthController::class, 'verifyOtpPassword'])->name('verify.otp.password');
Route::get('/reset-password/{token}', [AuthController::class, 'resetPage'])->name('reset.page');
Route::post('/reset-password', [AuthController::class, 'resetPost'])->name('reset.post');

// ====================== API ======================
Route::post('/api/cek/transaksi', [homeController::class, 'cekTransApi']);
Route::get('/api/brands', [apiController::class, "brands"]);

// ====================== TRIPAY ======================
Route::post('/transaction', [transactionController::class, 'store']);
Route::post('/tripay/callback', [transactionController::class, 'callback']);
Route::get('/testing/tripay', [transactionController::class, 'testing']);

// ====================== DIGIFLAZZ ======================
Route::post('/digiflazz/callback', [digiflazzController::class, 'webhook']);
Route::get('cek-status', [transactionController::class, 'CekStatusDigiflazz']);

// ====================== GAME CHECK ======================
Route::get('/cekUserName', function (Request $request) {
    $response = ApiGames::cekUserName($request->game, $request->user_id);
    return $response;
});

// ====================== HELLO TEST ======================
Route::get('/hello-test', function () {
    try {
        $tripay = new TripayHelper();
        $data = $tripay->getChannel();
        return response()->json($data);
    } catch (\Throwable $e) {
        return response()->json([
            'error' => true,
            'message' => $e->getMessage(),
            'trace' => $e->getTraceAsString(),
        ]);
    }
});

// ====================== FALLBACK REACT ROUTES ======================
Route::fallback(function () {
    return Inertia::render('Error', ['status' => 404]);
});

Route::get('/{any}', function () {
    return Inertia::render('Home'); // atau komponen React utama kamu
})->where('any', '^(?!admin).*$'); // ⬅️ Ini exclude "/admin" supaya tidak bentrok dengan Filament
