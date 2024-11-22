<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Venda;
use Illuminate\Http\Request;

class VendaController extends Controller
{
    // Listar todas as vendas
    public function index()
    {
        return Venda::all();
    }

    // Exibir uma venda específica
    public function show(Venda $venda)
    {
        return $venda;
    }

    public function totalVendas()
    {
        // Soma todos os valores do campo 'valor_venda'
        $total = Venda::sum('valor_venda');

        return response()->json([
            'total_vendas' => $total,
        ]);
    }
    public function totalVendasKg()
    {
        // Soma todos os valores do campo 'quantidade'
        $total = Venda::sum('quantidade');

        return response()->json([
            'quantidade' => $total,
        ]);
    }
    // Criar uma nova venda
    public function store(Request $request)
    {
        $data = $request->validate([
            'tipo_produto' => 'required|string|max:255',
            'quantidade' => 'required|integer|min:1',
            'valor_venda' => 'required|numeric|min:0',
        ]);

        $venda = Venda::create($data);

        return response()->json($venda, 201);
    }

    // Atualizar uma venda existente
    public function update(Request $request, Venda $venda)
    {
        $data = $request->validate([
            'tipo_produto' => 'sometimes|string|max:255',
            'quantidade' => 'sometimes|integer|min:1',
            'valor_venda' => 'sometimes|numeric|min:0',
        ]);

        $venda->update($data);

        return response()->json($venda);
    }

    // Deletar uma venda
    public function destroy(Venda $venda)
    {
        $venda->delete();

        return response()->json(null, 200);
    }
}
