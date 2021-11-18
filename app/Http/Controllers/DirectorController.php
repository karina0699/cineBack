<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DirectorController extends Controller
{

    function listar(){
        $directores = DB::table('director')->get();

        return response()->json($directores, 200 );
    }
    
}
