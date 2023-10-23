import 'package:flutter/material.dart';
import 'package:kisiler/entity/persons.dart';
import 'package:kisiler/views/person_detail.dart';
import 'package:kisiler/views/person_registration.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool aramaYapiliyormu = false;

  Future<List<Persons>> tumKisileriGoster() async {
    var kisilerListesi = <Persons>[];
    var k1 = Persons(kisi_id: 1, kisi_ad: "Muhammed", kisi_tel: "8743");
    var k2 = Persons(kisi_id: 2, kisi_ad: "Hasan", kisi_tel: "5688");
    var k3 = Persons(kisi_id: 3, kisi_ad: "Hüseyin", kisi_tel: "2390");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        title: aramaYapiliyormu
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonucu) {
                  print("Arama Sonucu: $aramaSonucu");
                },
              )
            : const Text("Kişiler "),
        actions: [
          aramaYapiliyormu
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      aramaYapiliyormu = false;
                    });
                  },
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyormu = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
        ],
      ),
      body: FutureBuilder<List<Persons>>(
        future: tumKisileriGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length,
              itemBuilder: (context, index) {
                var kisi = kisilerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonDetail(
                                  kisi: kisi,
                                ))).then((value) {
                      print("Çalıştı");
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${kisi.kisi_ad} Silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      print("Kişi Sil: ${kisi.kisi_id}");
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.black54,
                            )),
                      ]),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonRegistration()))
              .then((value) {
            print("Çalıştı");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
