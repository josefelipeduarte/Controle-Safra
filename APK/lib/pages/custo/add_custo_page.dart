import 'package:agro/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddCustoPage extends StatefulWidget {
  const AddCustoPage({super.key});

  @override
  State<AddCustoPage> createState() => _AddCustoPageState();
}

class _AddCustoPageState extends State<AddCustoPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  bool _isLoading = false; // Para exibir indicador de carregamento

  Future<void> _sendCusto() async {
    setState(() {
      _isLoading = true;
    });

    // Dados do formulário
    final Map<String, dynamic> data = {
      'nome': _nomeController.text,
      'preco': _precoController.text,
      'descricao': _descricaoController.text,
    };

    try {
      // Enviar requisição POST para a API
      final response = await http.post(
        Uri.parse('$baseUrl/api/custos'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      // Verificar resposta da API
      if (response.statusCode == 201) {
        // Sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Custo cadastrado com sucesso!')),
        );
        Navigator.pop(context); // Voltar para a tela anterior
      } else {
        // Erro
        final responseBody = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: ${responseBody['message']}')),
        );
      }
    } catch (e) {
      // Tratamento de erros de rede
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro de conexão: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Custo'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Custo'),
            ),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (_nomeController.text.isNotEmpty &&
                          _precoController.text.isNotEmpty &&
                          _descricaoController.text.isNotEmpty) {
                        _sendCusto(); // Chamar função para enviar os dados
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Preencha todos os campos!')),
                        );
                      }
                    },
                    child: const Text('Salvar Custo'),
                  ),
          ],
        ),
      ),
    );
  }
}
