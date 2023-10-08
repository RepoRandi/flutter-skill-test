import 'package:flutter/material.dart';

class SoalE extends StatefulWidget {
  const SoalE({super.key});

  @override
  _SoalEPageState createState() => _SoalEPageState();
}

class _SoalEPageState extends State<SoalE> {
  TextEditingController textController = TextEditingController();
  String titleFormat = '';
  String normalFormat = '';

  void formatText() {
    setState(() {
      titleFormat = toTitleCase(textController.text);

      String temp = textController.text.toLowerCase();
      if (temp.isNotEmpty) {
        normalFormat = temp[0].toUpperCase() + temp.substring(1);
      } else {
        normalFormat = '';
      }
    });
  }

  String toTitleCase(String text) {
    return text.toLowerCase().split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      }
      return '';
    }).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal E'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Masukkan Teks'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: formatText,
              child: const Text('Format Teks'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text('Format Judul: $titleFormat'),
            Text('Format Biasa: $normalFormat'),
          ],
        ),
      ),
    );
  }
}
