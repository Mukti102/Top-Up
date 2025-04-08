<?php

namespace Database\Factories;

use App\Models\News;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Arr;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\News>
 */
class NewsFactory extends Factory
{

    protected $model = News::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => $this->faker->sentence(),
            'content' => $this->faker->paragraph(),
            'thumbnail' => $this->faker->imageUrl(640, 480, 'news', true),
            "tags" => Arr::random(["MLBB", "PUBG", "Valorant", "Ragnarok", "E-Sports", "Promo", "Guides"], 3),
        ];
    }
}
