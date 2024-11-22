import 'package:agro/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditVendaPage extends StatelessWidget {
  final Map<String, dynamic> venda;

  const EditVendaPage({super.key, required this.venda});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tipoController =
        TextEditingController(text: venda['tipo_produto']);
    final TextEditingController quantidadeController =
        TextEditingController(text: venda['quantidade'].toString());
    final TextEditingController valorController =
        TextEditingController(text: venda['valor_venda'].toString());

    Future<void> _editVenda() async {
      final Map<String, dynamic> data = {
        'tipo_produto': tipoController.text,
        'quantidade': int.parse(quantidadeController.text),
        'valor_venda': double.parse(valorController.text),
      };

      try {
        final response = await http.put(
          Uri.parse('$baseUrl/api/vendas/${venda['id']}'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(data),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Venda atualizada com sucesso!')),
          );
          Navigator.pop(context, true); // Retorna à página anterior
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Erro ao atualizar venda: ${response.statusCode}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro de conexão: $e')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Venda'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tipoController,
              decoration: const InputDecoration(labelText: 'Tipo de Produto'),
            ),
            TextField(
              controller: quantidadeController,
              decoration: const InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: valorController,
              decoration: const InputDecoration(labelText: 'Valor de Venda'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editVenda,
              child: const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
