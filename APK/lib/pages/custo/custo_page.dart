import 'dart:developer';

import 'package:agro/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'add_custo_page.dart';
import 'edit_custo_page.dart';

class CustoPage extends StatefulWidget {
  const CustoPage({super.key});

  @override
  State<CustoPage> createState() => _CustoPageState();
}

class _CustoPageState extends State<CustoPage> {
  List<dynamic> _custos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCustos();
  }

  Future<void> _fetchCustos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/custos'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _custos = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erro ao carregar custos: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro de conexão: $e')),
      );
      log('data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteCusto(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/api/custos/$id'),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Custo deletado com sucesso!')),
        );
        _fetchCustos(); // Atualizar a lista de custos
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erro ao deletar custo: ${response.statusCode}')),
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
        title: const Text(
          'Lista de custos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Cor do texto no AppBar
          ),
        ),
        centerTitle: true, // Centraliza o título no AppBar
        backgroundColor: Colors.green, // Define a cor de fundo do AppBar
        elevation: 4, // Sombra do AppBar (pode ajustar ou remover com 0)
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _custos.isEmpty
              ? const Center(child: Text('Nenhum custo cadastrado.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _custos.length,
                  itemBuilder: (context, index) {
                    final custo = _custos[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Text(
                            custo['id'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          custo['nome'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Valor: R\$ ${custo['preco']}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              custo['descricao'] ?? 'Sem descrição',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditCustoPage(custo: custo),
                                  ),
                                ).then((updated) {
                                  if (updated == true) {
                                    _fetchCustos(); // Atualizar a lista após edição
                                  }
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _deleteCusto(custo['id']);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCustoPage()),
          ).then((_) => _fetchCustos()); // Atualizar a lista ao retornar
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
