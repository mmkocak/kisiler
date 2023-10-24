import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static const String veritabaniAdi = "rehber.db";

  static Future<Database> veriTabaniErisim() async {
    String veriTabaniPath = join(await getDatabasesPath(), veritabaniAdi);

    if (await databaseExists(veriTabaniPath)) {
      print("Zaten var");
    } else {
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veriTabaniPath).writeAsBytes(bytes, flush: true);
      print("Veritabanı Kopyalandı");
    }
    return openDatabase(veriTabaniPath);
  }
}
