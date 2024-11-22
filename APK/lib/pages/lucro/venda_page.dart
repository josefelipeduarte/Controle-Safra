import 'package:agro/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'add_venda_page.dart';
import 'edit_venda_page.dart';

class LucroPage extends StatefulWidget {
  const LucroPage({super.key});

  @override
  State<LucroPage> createState() => _LucroPageState();
}

class _LucroPageState extends State<LucroPage> {
  List<dynamic> _vendas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchVendas();
  }

  Future<void> _fetchVendas() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/vendas'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _vendas = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erro ao carregar vendas: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro de conexão: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteVenda(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/api/vendas/$id'),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Venda deletada com sucesso!')),
        );
        _fetchVendas();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erro ao deletar venda: ${response.statusCode}')),
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
          'Vendas',
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
          : _vendas.isEmpty
              ? const Center(child: Text('Nenhuma venda registrada.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _vendas.length,
                  itemBuilder: (context, index) {
                    final venda = _vendas[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(
                            venda['id'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          venda['tipo_produto'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quantidade: ${venda['quantidade']} Kg',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Valor: R\$ ${venda['valor_venda']}',
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
                                        EditVendaPage(venda: venda),
                                  ),
                                ).then((updated) {
                                  if (updated == true) {
                                    _fetchVendas();
                                  }
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _deleteVenda(venda['id']);
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
            MaterialPageRoute(builder: (context) => const AddVendaPage()),
          ).then((_) => _fetchVendas());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
