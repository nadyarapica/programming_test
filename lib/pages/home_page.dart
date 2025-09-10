import 'package:flutter/material.dart';
import 'package:speed_programming_test1/data/movie_data.dart';
import 'package:speed_programming_test1/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/horror1.jpeg"), 
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors
            .transparent, 
        appBar: AppBar(
          title: const Text('Daftar Film'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 12, 
            mainAxisSpacing: 12, 
            childAspectRatio: 0.65, 
          ),
          itemBuilder: (context, index) {
            final m = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(movie: m),
                  ),
                );
              },
              child: Card(
                color: Colors.white.withOpacity(0.85),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          m.posterAsset,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.broken_image,
                                  size: 50, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${m.year}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
