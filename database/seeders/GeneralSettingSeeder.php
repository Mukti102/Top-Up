<?php

namespace Database\Seeders;

use App\Models\GeneralModel;
use Illuminate\Database\Seeder;
use App\Models\GeneralSetting;

class GeneralSettingSeeder extends Seeder
{
    public function run()
    {
        GeneralModel::firstOrCreate([
            'site_name' => 'Nama Website',
            'site_description' => 'Deskripsi singkat website.',
            'site_owner' => 'Pemilik Website',
            'site_logo' => "sdsd",
            'site_keywords' => json_encode(['website', 'laravel', 'filament']),
        ]);
    }
}
