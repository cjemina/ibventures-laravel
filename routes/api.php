<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/user_details', 'Main@user_details');
Route::post('/financial_details', 'Main@financial_details');
Route::get('/validation/{id}', 'Main@validation');
Route::post('/validation', 'Main@validation');
Route::get('/formula/{id}', 'Main@formula');
Route::get('/generate/{id}', 'Main@generate');
Route::get('/mail/{id}', 'Main@send');