<?php

namespace App\Http\Middleware;

use App\Models\Kupon;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Inertia\Middleware;
use Outerweb\Settings\Models\Setting;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request): ?string
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @return array<string, mixed>
     */
    public function share(Request $request): array
    {

        $settings = Setting::whereIn('key', [
            'general.brand_name',
            'seo.title',
            'seo.description',
            'seo.keywords',
            'slider',
            'theme',
            'general.brand.favicon',
            'general.brand.logo',
            'login.svg',
            'register.svg',
            'forgot.svg',
            'dark_theme',
            'background.home',
            'background.show',
            'sosmed.facebook',
            'sosmed.instagram',
            'sosmed.instagram',
            'sosmed.youtube',
            'sosmed.linkedind',
            'sosmed.twitter',
            'OTP.svg',
            'reset.svg'
        ])->pluck('value', 'key')->toArray();
        return [
            ...parent::share($request),
            'auth' => [
                'user' => $request->user(),
            ],
            'Setting' => $settings,
            'admin_phone' => User::where('role_id', '1')->first()->phone,
            'kupon' => Kupon::where('status', '1')->get(),
            'flash' => [
                'message' => fn() => $request->session()->get('message'),
                'status' => fn() => $request->session()->get('status'),
                'error' => fn() => $request->session()->get('error'),
            ],
        ];
    }
}
