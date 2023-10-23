import 'package:flutter/material.dart';
import 'package:kisiler/entity/persons.dart';

class PersonDetail extends StatefulWidget {
  Persons kisi;
  PersonDetail({required this.kisi});

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  var kisiAd = TextEditingController();
  var kisiTel = TextEditingController();
  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    kisiAd.text = kisi.kisi_ad;
    kisiTel.text = kisi.kisi_tel;
  }

  Future<void> Guncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    print(" Kişi Güncelle: $kisi_id - $kisi_ad - $kisi_tel");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: kisiAd,
                decoration: const InputDecoration(hintText: "Kişi Ad"),
              ),
              TextField(
                controller: kisiTel,
                decoration: const InputDecoration(hintText: "Telefon Numarası"),
              ),
              ElevatedButton(
                onPressed: () {
                  Guncelle(widget.kisi.kisi_id, kisiAd.text, kisiTel.text);
                },
                child: const Text("Güncelle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
