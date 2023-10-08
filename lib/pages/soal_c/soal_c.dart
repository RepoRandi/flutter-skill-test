import 'package:flutter/material.dart';

class SoalC extends StatefulWidget {
  const SoalC({super.key});

  @override
  _SoalCPageState createState() => _SoalCPageState();
}

class _SoalCPageState extends State<SoalC> {
  TextEditingController teksController = TextEditingController();
  Map<String, int> characterCounts = {};

  void hitungKarakter() {
    String teks = teksController.text;
    Map<String, int> counts = {};

    for (int i = 0; i < teks.length; i++) {
      if (teks[i] != ' ') {
        counts[teks[i]] = (counts[teks[i]] ?? 0) + 1;
      }
    }

    setState(() {
      characterCounts = counts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal C'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: teksController,
              decoration: const InputDecoration(labelText: 'Masukkan Teks'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: hitungKarakter,
              child: const Text('Hitung Karakter'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: characterCounts.keys.length,
                itemBuilder: (context, index) {
                  String key = characterCounts.keys.elementAt(index);
                  return ListTile(
                    title: Text('$key – ${characterCounts[key]}'),
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
