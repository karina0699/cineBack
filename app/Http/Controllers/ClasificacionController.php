<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ClasificacionController extends Controller
{

    function listar(){
        $clasificaciones = DB::table('clasificacion')->get();

        return response()->json($clasificaciones, 200 );
    }
    
}
