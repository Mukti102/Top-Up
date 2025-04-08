 <?php

    namespace App\Http\Controllers;

    use App\Helpers\ApiGames;
    use Illuminate\Http\Request;

    class apiGamesController extends Controller
    {
        public function check(Request $request)
        {
            $request->validate([
                "game" => "required",
                "user_id" => "required"
            ]);
            // contoh 
            // freefire = 198853145
            // mobilelegend = 369422218 9723
            $response = ApiGames::cekUserName($request->game, $request->user_id);
            return response()->json($response);
        }
    }
