import 'package:flutter/material.dart';
import 'adubo_page.dart';
import 'produtividade_page.dart';
import 'video_page.dart';

class WikiPage extends StatelessWidget {
  const WikiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wiki'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Informações Úteis para o Produtor',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildWikiItem(
            context,
            title: 'Qual adubo usar?',
            description: 'Aprenda a escolher o adubo certo para sua safra.',
            icon: Icons.agriculture,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AduboPage()),
              );
            },
          ),
          const SizedBox(height: 10),
          _buildWikiItem(
            context,
            title: 'Como melhorar a produtividade?',
            description: 'Dicas para otimizar o rendimento da sua lavoura.',
            icon: Icons.trending_up,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdutividadePage()),
              );
            },
          ),
          const SizedBox(height: 10),
          _buildWikiItem(
            context,
            title: 'Vídeos Educativos',
            description: 'Assista vídeos sobre técnicas de plantio.',
            icon: Icons.video_library,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VideoPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWikiItem(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
