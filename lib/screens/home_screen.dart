// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:ebook_safira/screens/book_details_screen.dart';
// PASTIKAN BARIS INI BENAR SESUAI LOKASI FILE AUTHOR PROFILE ANDA
import 'package:ebook_safira/screens/author_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk contoh
    final List<String> authorImages = [
      'radityadika.jpeg',
      'valerie.jpeg',
      'ikanatassa.jpeg',
      'andreahinata.jpeg',
    ];

    final List<String> authorName = [
      'Raditya Dika',
      'Valerie',
      'Ika Natassa',
      'Andrea Hinata',
    ];

    // Data untuk New Books (Horizontal Scroll)
    final List<String> bookCovers = [
      'aldebaran.jpeg',
      'hana.jpeg',
      'komet.jpeg',
      'matahari.jpeg',
      'moon.jpeg',
    ];

    final List<String> bookTitles = [
      'Aldebaran',
      'Hana Tara Haja',
      'Komet',
      'Matahari Minor',
      'Moon',
    ];

    // --- DATA UNTUK RECOMMENDED BOOKS (Vertical List) ---
    final List<String> recommendedBookCovers = [
      'bibigill.jpg',
      'bintang.jpg',
      'bulan.jpg',
      'lampu.jpg',
      'nebula.jpg',
      'siputih.jpg',
      'cerosdanbatozar.jpg',
    ];

    final List<String> recommendedBookTitles = [
      'Bibi Gill',
      'Bintang',
      'Bulan',
      'Lampu',
      'Nebula',
      'Si Putih',
      'Ceros Dan Batozar',
    ];
    // ---------------------------------------------------------

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'HOME',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),

          // 1. Popular Authors Section
          const Text(
            'Popular Authors',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: authorImages.length,
              itemBuilder: (context, index) {
                final currentAuthorName = authorName[index];
                final currentAuthorImage = authorImages[index];

                return GestureDetector(
                  onTap: () {
                    // Logika Navigasi ke AuthorProfileScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthorProfileScreen(
                          authorName: currentAuthorName,
                          authorImage: currentAuthorImage,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Column(
                      children: <Widget>[
                        // MEMUAT FOTO PENULIS
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/images/$currentAuthorImage',
                          ),
                        ),
                        const SizedBox(height: 5),
                        // MEMUAT NAMA PENULIS
                        Text(
                          currentAuthorName,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),

          // 2. New Books Section (Horizontal Scroll)
          const Text(
            'New Books',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 265,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bookCovers.length,
              itemBuilder: (context, index) {
                final String currentCover = bookCovers[index];
                final String currentTitle = bookTitles[index];
                final String currentAuthor =
                    authorName[index % authorName.length];

                return GestureDetector(
                  onTap: () {
                    // PINDAH KE HALAMAN DETAIL BUKU
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsScreen(
                          title: currentTitle,
                          coverAsset: currentCover,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Cover Buku
                        Container(
                          width: 150,
                          height: 205,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/$currentCover',
                              width: 150,
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Teks Judul Buku
                        Text(
                          currentTitle,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Nama Penulis
                        Text(
                          currentAuthor,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),

          // 3. Recommended Books Section (Vertical List)
          const Text(
            'Recommended Books',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // ListView.builder untuk list vertikal
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            itemCount: recommendedBookCovers.length,
            itemBuilder: (context, index) {
              final String currentCover = recommendedBookCovers[index];
              final String currentTitle = recommendedBookTitles[index];
              final String currentAuthor =
                  authorName[index % authorName.length];

              return GestureDetector(
                onTap: () {
                  // PINDAH KE HALAMAN DETAIL BUKU
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailsScreen(
                        title: currentTitle,
                        coverAsset: currentCover,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cover Buku (di sisi kiri)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/$currentCover',
                          width: 60,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Detail Buku (di sisi kanan)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentTitle,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              currentAuthor,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Rating: Dengan MainAxisSize.min untuk mencegah overflow
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Text(' 4.5', style: TextStyle(fontSize: 12)),
                              ],
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
