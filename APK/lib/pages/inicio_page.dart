import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  // Função para buscar total de vendas
  Future<String> fetchTotalVendas() async {
    final response = await http.get(Uri.parse('$baseUrl/api/vendas/total'));
    if (response.statusCode == 200) {
      return 'R\$ ${json.decode(response.body)['total_vendas']}';
    } else {
      throw Exception('Erro ao carregar total de vendas');
    }
  }

  // Função para buscar total de custos
  Future<String> fetchTotalCustos() async {
    final response = await http.get(Uri.parse('$baseUrl/api/custos/total'));
    if (response.statusCode == 200) {
      return 'R\$ ${json.decode(response.body)['preco']}';
    } else {
      throw Exception('Erro ao carregar total de custos');
    }
  }

  // Função para buscar total de KG
  Future<String> fetchTotalKG() async {
    final response = await http.get(Uri.parse('$baseUrl/api/vendas/total/kg'));
    if (response.statusCode == 200) {
      return '${json.decode(response.body)['quantidade']} Kg';
    } else {
      throw Exception('Erro ao carregar total de KG');
    }
  }

  // Função para calcular resultado (vendas - custos)
  Future<String> calculateResultado() async {
    final vendas = await fetchTotalVendas();
    final custos = await fetchTotalCustos();

    try {
      // Extrair valores numéricos
      final vendasValor =
          double.parse(vendas.replaceAll(RegExp(r'[^\d.]'), ''));
      final custosValor =
          double.parse(custos.replaceAll(RegExp(r'[^\d.]'), ''));
      final resultado = vendasValor - custosValor;

      return 'R\$ ${resultado.toStringAsFixed(2)}';
    } catch (e) {
      return 'Erro no cálculo';
    }
  }

  // Função para consolidar os dados
  Future<List<String>> fetchData() async {
    try {
      final totalKG = await fetchTotalKG();
      final resultado = await calculateResultado();
      final totalVendas = await fetchTotalVendas();
      final totalCustos = await fetchTotalCustos();

      return [
        totalKG,
        resultado,
        totalVendas,
        totalCustos,
      ];
    } catch (e) {
      throw Exception('Erro ao consolidar dados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Inicial',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4,
      ),
      body: FutureBuilder<List<String>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar os dados'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum dado disponível'));
          }

          final data = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
              children: [
                _buildSquare('Total de KG', data[0], Icons.agriculture),
                _buildSquare(
                    'Resultado (Vendas - Custos)', data[1], Icons.check),
                _buildSquare('Total de Vendas', data[2], Icons.attach_money),
                _buildSquare(
                    'Total de Custos', data[3], Icons.attach_money, Colors.red),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSquare(String title, String value, IconData icon,
      [Color iconColor = Colors.green]) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: iconColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
