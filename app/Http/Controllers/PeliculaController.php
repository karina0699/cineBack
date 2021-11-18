<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;



class PeliculaController extends Controller
{

   function listar(Request $request){
      $peliculas =  DB::table('pelicula')
        ->join('director', 'director.id_director', '=', 'pelicula.fk_director_pelicula')
        ->join('idioma', 'idioma.id_idioma', '=', 'pelicula.fk_idioma')
        ->join('actor_reparto', 'actor_reparto.id_reparto', '=', 'pelicula.fk_director_pelicula')
        ->join('clasificacion', 'clasificacion.id_clasificacion', '=', 'pelicula.fk_clasificiacion')
        ->select('pelicula.id_pelicula', 'pelicula.nombre_pelicula', 'pelicula.duracion', 'pelicula.trailer',
                  'pelicula.portada', 'pelicula.sipnosis', 'pelicula.estatus', 'idioma.idioma AS fk_idioma', 'director.director AS fk_director_pelicula',
                  'clasificacion.clasificacion AS fk_clasificiacion', 'actor_reparto.actor AS fk_actor_reparto')->get();
                
      return response()->json($peliculas, 200);
    }

    function obtenerPelicula(Request $request, $id_pelicula){
      $pelicula = DB::table('pelicula')
      ->join('director', 'director.id_director', '=', 'pelicula.fk_director_pelicula')
      ->join('idioma', 'idioma.id_idioma', '=', 'pelicula.fk_idioma')
      ->join('actor_reparto', 'actor_reparto.id_reparto', '=', 'pelicula.fk_director_pelicula')
      ->join('clasificacion', 'clasificacion.id_clasificacion', '=', 'pelicula.fk_clasificiacion')
      ->where('pelicula.id_pelicula', '=', $id_pelicula)
      ->select('pelicula.id_pelicula', 'pelicula.nombre_pelicula', 'pelicula.duracion', 'pelicula.trailer',
                  'pelicula.portada', 'pelicula.sipnosis', 'pelicula.estatus', 'idioma.id_idioma AS fk_idioma', 'director.id_director AS fk_director_pelicula',
                  'clasificacion.id_clasificacion AS fk_clasificacion', 'actor_reparto.id_reparto AS fk_actor_reparto')->first();
              
       return response()->json($pelicula, 200);      
    }

    function actualizarPelicula(Request $request, $id_pelicula){

      DB::table('pelicula')->where('id_pelicula', $id_pelicula)->update(
         array(
           'nombre_pelicula'=> $request-> nombre_pelicula,
           'duracion'=> $request-> duracion,
           'trailer'=> $request-> trailer,
           //'portada'=> $request-> portada,
           'sipnosis'=> $request-> sipnosis,
           'estatus'=> $request-> estatus,
           'fk_idioma'=> $request-> fk_idioma,
           'fk_director_pelicula'=> $request-> fk_director_pelicula,
           'fk_actor_reparto'=> $request-> fk_actor_reparto,
           'fk_clasificiacion'=> $request-> fk_clasificacion
        ));
      return [
        'status'=> 'success',
        'statuscode' => '200',
        'message' => 'Registro actualizado'
     ];
  }

  function crearPelicula(Request $request){

    DB::table('pelicula')->insert(
       array(
        'nombre_pelicula'=> $request-> nombre_pelicula,
        'duracion'=> $request-> duracion,
        'trailer'=> $request-> trailer,
        //'portada'=> $request-> portada,
        'sipnosis'=> $request-> sipnosis,
        'fk_idioma'=> $request-> fk_idioma,
        'fk_director_pelicula'=> $request-> fk_director_pelicula,
        'fk_actor_reparto'=> $request-> fk_actor_reparto,
        'fk_clasificiacion'=> $request-> fk_clasificacion
      ));
    return [
      'status'=> 'success',
      'statuscode' => '200',
      'message' => 'Registro guardado'
   ];
}

    function eliminarPelicula(Request $request, $id_pelicula){
      $inactivo = 0;
      DB::table('pelicula')->where('id_pelicula', $id_pelicula)->update( array('estatus'=> $inactivo));
      return [
        'status'=> 'success',
        'statuscode' => '200',
        'message' => 'Registro actualizado'
     ];
  }
  
}
