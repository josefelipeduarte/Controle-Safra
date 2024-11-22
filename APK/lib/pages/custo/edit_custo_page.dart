import 'package:agro/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditCustoPage extends StatefulWidget {
  final Map<String, dynamic> custo; // Dados do custo a ser editado

  const EditCustoPage({super.key, required this.custo});

  @override
  State<EditCustoPage> createState() => _EditCustoPageState();
}

class _EditCustoPageState extends State<EditCustoPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _precoController;
  late TextEditingController _descricaoController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.custo['nome']);
    _precoController =
        TextEditingController(text: widget.custo['preco'].toString());
    _descricaoController =
        TextEditingController(text: widget.custo['descricao'] ?? '');
  }

  Future<void> _updateCusto() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/api/custos/${widget.custo['id']}'),
        body: {
          'nome': _nomeController.text,
          'preco': _precoController.text,
          'descricao': _descricaoController.text,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Custo atualizado com sucesso!')),
        );
        Navigator.pop(context, true); // Retorna sucesso ao chamar a página
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erro ao atualizar custo: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro de conexão: $e')),
      );
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _precoController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Custo'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _precoController,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateCusto,
                child: const Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
