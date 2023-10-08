import 'package:flutter/material.dart';
import 'package:skill_test/model/produk_model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class SoalADetail extends StatefulWidget {
  final Produk product;

  const SoalADetail({super.key, required this.product});

  @override
  _SoalADetailState createState() => _SoalADetailState();
}

class _SoalADetailState extends State<SoalADetail> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.nama_barang),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Property')),
            DataColumn(label: Text('Value')),
          ],
          rows: [
            DataRow(cells: [
              const DataCell(Text('Nama Barang')),
              DataCell(Text(widget.product.nama_barang)),
            ]),
            DataRow(cells: [
              const DataCell(Text('Kode Barang')),
              DataCell(Text(widget.product.kode_barang)),
            ]),
            DataRow(cells: [
              const DataCell(Text('Jumlah Barang')),
              DataCell(Text('${widget.product.jumlah_barang}')),
            ]),
            DataRow(cells: [
              const DataCell(Text('Tanggal')),
              DataCell(Text(DateFormat('dd MMMM yyyy HH:mm', 'id_ID')
                  .format(widget.product.tanggal))),
            ]),
          ],
        ),
      ),
    );
  }
}
