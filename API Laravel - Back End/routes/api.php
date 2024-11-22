<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\VendaController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');



//daqui pra baixo
Route::apiResource('posts', PostController::class)->except([
    'create', 'show', 'edit'
]);

//Rota para teste da API.
Route::get('/', function () {
    return response()->json(['status' => 'OK'], 200);
});

use App\Http\Controllers\Api\CustoController;

Route::prefix('custos')->group(function () {
    Route::get('/', [CustoController::class, 'index']); // Listar custos
    Route::get('/total', [CustoController::class, 'totalCusto']);
    Route::post('/', [CustoController::class, 'store']); // Criar custo
    Route::get('/{custo}', [CustoController::class, 'show']); // Exibir custo
    Route::put('/{custo}', [CustoController::class, 'update']); // Atualizar custo
    Route::delete('/{custo}', [CustoController::class, 'destroy']); // Deletar custo
});

Route::prefix('vendas')->group(function () {
    Route::get('/', [VendaController::class, 'index']); // Listar vendas
    Route::get('/total', [VendaController::class, 'totalVendas']);
    Route::get('/total/kg', [VendaController::class, 'totalVendasKg']);  // Total de vendas
    Route::post('/', [VendaController::class, 'store']); // Criar venda
    Route::get('/{venda}', [VendaController::class, 'show']); // Exibir venda
    Route::put('/{venda}', [VendaController::class, 'update']); // Atualizar venda
    Route::delete('/{venda}', [VendaController::class, 'destroy']); // Deletar venda
});
