<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
 */

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->post('/usuario/insertar', ['uses' => 'UsuarioController@insertar']);
$router->post('/usuario/login', ['uses' => 'UsuarioController@login']);

$router->group(['middleware' => 'auth'], function () use ($router) {
   

});

 /*peliculas */
 $router->get('/pelicula/listar', ['uses' => 'PeliculaController@listar']);
 $router->post('/pelicula/crear', ['uses' => 'PeliculaController@crearPelicula']);
 $router->get('/pelicula/obtener/{id_pelicula}', ['uses' => 'PeliculaController@obtenerPelicula']);
 $router->put('/pelicula/eliminar/{id_pelicula}', ['uses' => 'PeliculaController@eliminarPelicula']);
 $router->put('/pelicula/actualizar/{id_pelicula}', ['uses' => 'PeliculaController@actualizarPelicula']);

/*listar clasificacion*/
 $router->get('/actor/listar', ['uses' => 'ActorController@listar']);
/*listar actores*/
 $router->get('/clasificacion/listar', ['uses' => 'ClasificacionController@listar']);

/*listar idioma*/
 $router->get('/idioma/listar', ['uses' => 'IdiomaController@listar']);

/*listar director*/
 $router->get('/director/listar', ['uses' => 'DirectorController@listar']);
