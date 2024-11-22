<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Custo;
use Illuminate\Http\Request;

class CustoController extends Controller
{
    // Listar todos os custos
    public function index()
    {
        return Custo::all();
    }

    // Exibir um custo específico
    public function show(Custo $custo)
    {
        return $custo;
    }
    public function totalCusto()
    {
        // Soma todos os valores do campo 'valor_venda'
        $total = Custo::sum('preco');

        return response()->json([
            'preco' => $total,
        ]);
    }
    
    // Criar um novo custo
    public function store(Request $request)
    {
        $data = $request->validate([
            'nome' => 'required|string|max:255',
            'preco' => 'required|numeric|min:0',
            'descricao' => 'nullable|string',
        ]);

        $custo = Custo::create($data);

        return response()->json($custo, 201);
    }

    // Atualizar um custo existente
    public function update(Request $request, Custo $custo)
    {
        $data = $request->validate([
            'nome' => 'sometimes|string|max:255',
            'preco' => 'sometimes|numeric|min:0',
            'descricao' => 'nullable|string',
        ]);

        $custo->update($data);

        return response()->json($custo);
    }

    // Deletar um custo
    public function destroy(Custo $custo)
    {
        $custo->delete();

        return response()->json(null, 200);
    }
}
