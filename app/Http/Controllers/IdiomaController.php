<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class IdiomaController extends Controller
{

    function listar(){
        $idiomas = DB::table('idioma')->get();

        return response()->json($idiomas, 200 );
    }
    
}
