import 'package:flutter/material.dart';

class SoalD extends StatefulWidget {
  const SoalD({super.key});

  @override
  _SoalDPageState createState() => _SoalDPageState();
}

class _SoalDPageState extends State<SoalD> {
  TextEditingController nController = TextEditingController();
  List<String> results = [];

  void generateSequence() {
    setState(() {
      int? n = int.tryParse(nController.text);
      results = [];

      if (n != null && n > 0) {
        for (int i = 1; i <= n; i++) {
          if (i % 5 == 0 && i != 5) {
            results.add('IDIC');
          } else if (i % 6 == 0 && i != 6) {
            results.add('LPS');
          } else {
            results.add(i.toString());
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal D'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan Angka N'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: generateSequence,
              child: const Text('Generate Sequence'),
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
