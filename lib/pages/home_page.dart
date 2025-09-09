import 'package:flutter/material.dart';
import '../data/movie_data.dart';
import '../pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Film')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final m = movies[index];
          return ListTile(
            leading: Image.network(
              m.posterUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(m.title),
            subtitle: Text('${m.year}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(movie: m),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
