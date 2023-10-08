class Produk {
  int? id;
  String nama_barang;
  String kode_barang;
  int jumlah_barang;
  DateTime tanggal;

  Produk({
    this.id,
    required this.nama_barang,
    required this.kode_barang,
    required this.jumlah_barang,
    required this.tanggal,
  });

  factory Produk.fromMap(Map<String, dynamic> json) => Produk(
        id: json["id"],
        nama_barang: json["nama_barang"],
        kode_barang: json["kode_barang"],
        jumlah_barang: json["jumlah_barang"],
        tanggal: DateTime.parse(json["tanggal"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama_barang": nama_barang,
        "kode_barang": kode_barang,
        "jumlah_barang": jumlah_barang,
        "tanggal": tanggal.toIso8601String(),
      };
}
