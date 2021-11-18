<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UsuarioController extends Controller
{
    public function insertar(Request $request)
    {
        DB::table('usuario')->insert(
            array(
                'usuario' => $request->usuario,
                'contrasena' => Hash::make($request->contrasena),
            ));

        return [
            'status' => 'success',
            'statuscode' => '200',
            'message' => 'Registro guardado',
        ];
    }

    public function login(Request $request)
    {
        $usuario = DB::table('usuario')
            ->where('usuario', $request->usuario)
            ->first();

        if (!is_null($usuario) && Hash::check($request->contrasena, $usuario->contrasena)) {
            $usuario->token = Str::random(150);
            DB::table('usuario')->where('id', $usuario->id)->update(
                array(
                    'token' => $usuario->token,
                ));

                return [
                  'status'=> 'success',
                  'statuscode' => '200',
                  'message' => 'Registro exitoso',
                  'token' => $usuario->token,
               ];
        }else{
          return [
            'status'=> 'success',
            'statuscode' => '409',
            'message' => 'Registro fallido'
         ];
        }
    }
}
