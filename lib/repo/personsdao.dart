import 'package:kisiler/entity/persons.dart';

class Persondao {
  Future<void> kisiKayit(String kisiAdd, String kisiTell) async {
    ("Kişi kayıt $kisiAdd , $kisiTell");
  }

  Future<void> kisiGuncelle(int kisiiD, String kisiAdd, kisiTell) async {
    print("Kişi Guncelle $kisiiD , $kisiAdd  , $kisiTell");
  }

  Future<List<Persons>> tumKisileriAl() async {
    var kisilerListesi = <Persons>[];
    var k1 = Persons(kisiid: 1, kidiad: "Muhammed", kisiTell: "7876");
    var k2 = Persons(kisiid: 2, kidiad: "Ali", kisiTell: "5677");
    var k3 = Persons(kisiid: 3, kidiad: "Ahmet", kisiTell: "1298");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }

  Future<List<Persons>> kisiAra(String kisiara) async {
    var kisilerListesi = <Persons>[];
    var k1 = Persons(kisiid: 1, kidiad: "Muhammed", kisiTell: "7876");
    kisilerListesi.add(k1);
    return kisilerListesi;
  }
}
