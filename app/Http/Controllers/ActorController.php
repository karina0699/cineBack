<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ActorController extends Controller
{

    function listar(){
        $actores = DB::table('actor_reparto')->get();

        return response()->json($actores, 200 );
    }
    
}
