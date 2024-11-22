import 'package:agro/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddVendaPage extends StatefulWidget {
  const AddVendaPage({super.key});

  @override
  State<AddVendaPage> createState() => _AddVendaPageState();
}

class _AddVendaPageState extends State<AddVendaPage> {
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _addVenda() async {
    final Map<String, dynamic> data = {
      'tipo_produto': _tipoController.text,
      'quantidade': int.parse(_quantidadeController.text),
      'valor_venda': double.parse(_valorController.text),
    };

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/vendas'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Venda cadastrada com sucesso!')),
        );
        Navigator.pop(context, true); // Volta para a tela anterior
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erro ao cadastrar venda: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro de conexão: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Venda'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tipoController,
                decoration: const InputDecoration(labelText: 'Tipo de Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha o tipo do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantidadeController,
                decoration: const InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha a quantidade';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Digite apenas números inteiros';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valorController,
                decoration: const InputDecoration(labelText: 'Valor de Venda'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha o valor de venda';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Digite apenas números válidos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addVenda();
                  }
                },
                child: const Text('Cadastrar Venda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
