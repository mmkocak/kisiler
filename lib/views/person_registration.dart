import 'package:flutter/material.dart';

class PersonRegistration extends StatefulWidget {
  const PersonRegistration({super.key});

  @override
  State<PersonRegistration> createState() => _PersonRegistrationState();
}

class _PersonRegistrationState extends State<PersonRegistration> {
  var kisiAd = TextEditingController();
  var kisiTel = TextEditingController();

  Future<void> kayit(String kisi_ad, String kisi_tel) async {
    print(" Kişi Kayıt: $kisi_ad, - $kisi_tel");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
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
                  kayit(kisiAd.text, kisiTel.text);
                },
                child: const Text("Kaydet"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
