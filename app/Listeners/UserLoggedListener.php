<?php

namespace App\Listeners;

use App\Events\UserLogged;
use App\Models\UserLogs;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class UserLoggedListener
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(UserLogged $event): void
    {
        UserLogs::create([
            'user_id' => $event->user->id ?? 0,
            'name' => $event->user->name ?? 'AUTH GUEST',
            'ip_address' => request()->ip(),
            'user_agent' => request()->userAgent(),
            'keterangan' => $event->action
        ]);
    }
}
