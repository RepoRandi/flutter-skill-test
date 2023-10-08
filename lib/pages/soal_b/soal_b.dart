import 'dart:math';

import 'package:flutter/material.dart';

class SoalB extends StatefulWidget {
  const SoalB({Key? key}) : super(key: key);

  @override
  State<SoalB> createState() => _SoalBState();
}

class _SoalBState extends State<SoalB> {
  TextEditingController angkaController = TextEditingController();
  List<String> results = [];

  void pecahAngka() {
    setState(() {
      String angka = angkaController.text.replaceAll('.', '');
      results = [];
      for (int i = 0; i < angka.length; i++) {
        try {
          results.add((int.parse(angka[i]) * (pow(10, angka.length - i - 1)))
              .toString());
        } catch (e) {
          print("Karakter yang bukan angka ditemukan: ${angka[i]}");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal B'),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: angkaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan Angka'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: pecahAngka,
              child: const Text('Pecah Angka'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(results[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
