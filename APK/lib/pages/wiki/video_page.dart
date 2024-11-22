import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vídeos Educativos'),
        backgroundColor: Colors.green,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: [
          _buildVideoCard(
            context,
            title: 'Técnicas de Plantio de Milho',
            description: 'Aprenda as melhores práticas para plantar milho.',
            videoUrl: 'https://www.youtube.com/watch?v=5t08JsnFiK0',
          ),
          _buildVideoCard(
            context,
            title: 'Como escolher sementes de soja?',
            description: 'Dicas para selecionar as melhores sementes.',
            videoUrl: 'https://www.youtube.com/watch?v=5t08JsnFiK0',
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard(
    BuildContext context, {
    required String title,
    required String description,
    required String videoUrl,
  }) {
    return GestureDetector(
      onTap: () => _launchUrl(videoUrl),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.play_circle_fill, size: 50, color: Colors.green),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
