import 'package:flutter/material.dart';
import 'package:skill_test/helper/database_helper.dart';
import 'package:skill_test/model/produk_model.dart';

class SoalAFormAddEdit extends StatefulWidget {
  final Produk? product;

  const SoalAFormAddEdit({Key? key, this.product}) : super(key: key);

  @override
  _SoalAFormAddEditState createState() => _SoalAFormAddEditState();
}

class _SoalAFormAddEditState extends State<SoalAFormAddEdit> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _nameController.text = widget.product!.nama_barang;
      _kodeController.text = widget.product!.kode_barang;
      _jumlahController.text = widget.product!.jumlah_barang.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Tambah Produk' : 'Edit Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama Barang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan Nama Barang';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _kodeController,
                decoration: const InputDecoration(labelText: 'Kode Barang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan Kode Barang';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jumlahController,
                decoration: const InputDecoration(labelText: 'Jumlah Barang'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan Jumlah Barang';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Harap masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (widget.product == null) {
                      Produk newProduct = Produk(
                        nama_barang: _nameController.text,
                        kode_barang: _kodeController.text,
                        jumlah_barang: int.parse(_jumlahController.text),
                        tanggal: DateTime.now(),
                      );
                      int result =
                          await DatabaseHelper.instance.insert(newProduct);

                      if (result != 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Produk berhasil ditambahkan!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Gagal menambahkan produk!')),
                        );
                      }
                    } else {
                      Produk updatedProduct = Produk(
                        id: widget.product!.id,
                        nama_barang: _nameController.text,
                        kode_barang: _kodeController.text,
                        jumlah_barang: int.parse(_jumlahController.text),
                        tanggal: DateTime.now(),
                      );
                      int result =
                          await DatabaseHelper.instance.update(updatedProduct);

                      if (result != 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Produk berhasil diperbarui!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Gagal memperbarui produk!')),
                        );
                      }
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.product == null ? 'Tambah' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _kodeController.dispose();
    _jumlahController.dispose();
    super.dispose();
  }
}
