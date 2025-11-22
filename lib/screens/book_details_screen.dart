// lib/screens/book_details_screen.dart

import 'package:flutter/material.dart';
import 'reader_screen.dart';

// Fungsi Utilitas Warna
Color _getDominantColor(String coverAsset) {
  if (coverAsset.contains('aldebaran')) {
    return Colors.lightGreen.shade700;
  } else if (coverAsset.contains('hana')) {
    return Colors.greenAccent.shade700;
  } else if (coverAsset.contains('komet')) {
    return Colors.amber.shade700;
  } else if (coverAsset.contains('matahari')) {
    return Colors.orange.shade700;
  } else if (coverAsset.contains('moon') || coverAsset.contains('toolate')) {
    // moon.jpeg dan toolate.jpeg memiliki warna yang mirip
    return Colors.blueAccent.shade700;
  }
  // Warna default jika tidak ada yang cocok
  return Colors.grey.shade700;
}

// Widget utama tetap StatelessWidget, karena kita tidak mengubah state di sini,
// hanya memanggil fungsi utilitas warna yang statis.
class BookDetailsScreen extends StatelessWidget {
  final String title;
  final String coverAsset;

  const BookDetailsScreen({
    super.key,
    required this.title,
    required this.coverAsset,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Tentukan warna dominan
    final Color dominantColor = _getDominantColor(coverAsset);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // 2. Terapkan warna ke AppBar
        backgroundColor: dominantColor,
        foregroundColor: Colors.white, // Agar teks di AppBar terlihat jelas
      ),
      body: SingleChildScrollView(
        // Tambahkan SingleChildScrollView agar tidak overflow
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Detail Buku:', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                // Menampilkan cover
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/$coverAsset',
                    height: 300,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  'Anda akan mulai membaca buku ini.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 30),
                // TOMBOL MULAI MEMBACA
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (title.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReaderScreen(title: title),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.menu_book),
                    label: const Text('Mulai Membaca'),
                    style: ElevatedButton.styleFrom(
                      // 3. Terapkan warna ke tombol
                      backgroundColor: dominantColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // --- Tambahkan detail buku lainnya di sini ---
                // ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
