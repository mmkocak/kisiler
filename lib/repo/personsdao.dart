import 'package:kisiler/entity/persons.dart';
import 'package:kisiler/sqflite/veritabani_yardimcisi.dart';

class Persondao {
  Future<void> kisiKayit(String kisiAdd, String kisiTell) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisiAdd;
    bilgiler["kisi_tel"] = kisiTell;
    await db.insert("kisiler", bilgiler);
  }

  Future<void> kisiGuncelle(int kisiiD, String kisiAdd, kisiTell) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisiAdd;
    bilgiler["kisi_tel"] = kisiTell;
    await db
        .update("kisiler", bilgiler, where: "kisi_id = ?", whereArgs: [kisiiD]);
  }

  Future<List<Persons>> tumKisileriAl() async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kisiler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Persons(
          kisiid: satir["kisi_id"],
          kidiad: satir["kisi_ad"],
          kisiTell: satir["kisi_tel"]);
    });
  }

  Future<List<Persons>> kisiAra(String kisiara) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM kisiler WHERE kisi_ad Like'%$kisiara%' ");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Persons(
          kisiid: satir["kisi_id"],
          kidiad: satir["kisi_ad"],
          kisiTell: satir["kisi_tel"]);
    });
  }

  Future<void> kisiSil(int kisiiD) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();
    await db.delete("kisiler", where: "kisi_id=?", whereArgs: [kisiiD]);
  }
}
