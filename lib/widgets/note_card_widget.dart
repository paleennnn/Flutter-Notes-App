import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app1/models/note.dart' as NoteModel; // Menggunakan alias untuk model Note

// Daftar warna untuk kartu catatan
final _lightColors = [
  Colors.amber.shade300,
  Colors.lightBlue.shade300,
  Colors.lightGreen.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100,
];

// Kelas untuk widget kartu catatan
class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({Key? key, required this.note, required this.index}) : super(key: key);

  final NoteModel.Note note; // Gunakan tipe NoteModel.Note di sini
  final int index; // Indeks kartu catatan

  @override
  Widget build(BuildContext context) {
    // Format waktu dengan menggunakan bahasa Inggris
    final time = DateFormat.yMMMMd().add_jms().format(note.createdTime);
    // Tentukan tinggi minimum berdasarkan indeks
    final minHeight = _getMinHeight(index);
    // Tentukan warna kartu berdasarkan indeks
    final color = _lightColors[index % _lightColors.length];

    return Card(
      color: color, // Warna kartu
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(height: 4),
            Text(
              note.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menentukan tinggi minimum berdasarkan indeks
  double _getMinHeight(int index) {
    switch (index % 4) {
      case 0:
      case 3:
        return 100;
      case 1:
      case 2:
        return 150;
      default:
        return 100;
    }
  }
}
