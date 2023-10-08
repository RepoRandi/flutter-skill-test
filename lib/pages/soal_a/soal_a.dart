import 'package:flutter/material.dart';
import 'package:skill_test/helper/database_helper.dart';
import 'package:skill_test/model/produk_model.dart';
import 'package:skill_test/pages/soal_a/soal_a_detail.dart';
import 'package:skill_test/pages/soal_a/soal_a_form_add_edit.dart';
import 'package:table_calendar/table_calendar.dart';

class SoalA extends StatefulWidget {
  const SoalA({Key? key}) : super(key: key);

  @override
  State<SoalA> createState() => _SoalAState();
}

class _SoalAState extends State<SoalA> {
  late List<Produk> _products;
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _refreshProductList();
  }

  _refreshProductList() async {
    List<Produk> products = await DatabaseHelper.instance.queryAllProduk();
    if (_selectedDay != null) {
      products = products
          .where((product) => isSameDay(product.tanggal, _selectedDay!))
          .toList();
    }
    setState(() {
      _products = products;
      _isLoading = false;
    });
  }

  _searchProduct() async {
    List<Produk> products =
        await DatabaseHelper.instance.searchProduk(_searchController.text);
    if (_selectedDay != null) {
      products = products
          .where((product) => isSameDay(product.tanggal, _selectedDay!))
          .toList();
    }
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Soal A'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                      CalendarFormat.twoWeeks: 'Two Weeks',
                      CalendarFormat.week: 'Week',
                    },
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                      _refreshProductList();
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search by nama barang...',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                      ),
                      onChanged: (value) => _searchProduct(),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (BuildContext context, int index) {
                        var product = _products[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Text(product.nama_barang),
                              subtitle: Text(product.kode_barang),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SoalADetail(product: product),
                                  ),
                                );
                              },
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SoalAFormAddEdit(
                                                  product: product),
                                        ),
                                      );
                                      _refreshProductList();
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      int result = await DatabaseHelper.instance
                                          .delete(product.id!);

                                      if (result != 0) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Produk berhasil dihapus!')),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Gagal menghapus produk!')),
                                        );
                                      }
                                      _refreshProductList();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SoalAFormAddEdit()),
          );
          _refreshProductList();
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
