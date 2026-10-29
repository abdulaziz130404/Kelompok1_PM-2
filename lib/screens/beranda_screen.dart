import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../models/mata_kuliah.dart';
class BerandaScreen extends StatelessWidget {
  BerandaScreen({super.key});
  // Contoh data dummy mata kuliah
  final List<MataKuliah> daftarKuliah = [
    MataKuliah(nama: 'Pemrograman Mobile', hari: 'Senin', jam: '08:00 - 10:30', ruang: 'Lab Komputer 2'),
    MataKuliah(nama: 'Pemrograman Web', hari: 'Senin', jam: '13:00 - 15:30', ruang: 'Ruang 4.1'),
    MataKuliah(nama: 'Basis Data Lanjut', hari: 'Selasa', jam: '09:00 - 11:30', ruang: 'Lab Basis Data'),
  ];
  @override
  Widget build(BuildContext context) {
    // Inisialisasi format tanggal bahasa Indonesia
    initializeDateFormatting('id_ID', null);
    String tanggalHariIni = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());
return Scaffold(
  appBar: AppBar(
    title: const Text('Jadwal Kuliah Kampusku'),
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Menampilkan Tanggal Hari Ini
        Text(
          'Hari ini: $tanggalHariIni',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        const Text(
          'Daftar Mata Kuliah:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        
        // Menampilkan Daftar Menggunakan ListView.builder
        Expanded(
          child: ListView.builder(
            itemCount: daftarKuliah.length,
            itemBuilder: (context, index) {
              final mk = daftarKuliah[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.book, color: Colors.white),
                  ),
                  title: Text(mk.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${mk.jam} | Ruang: ${mk.ruang}'),
                  trailing: Text(mk.hari, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
);
  }
}