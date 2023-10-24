import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler/cubit/person_registration_detail_cubit.dart';
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
    kisiAd.text = kisi.kidiad;
    kisiTel.text = kisi.kisiTell;
  }

  @override
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
                  context
                      .read<PersonRegistrationDetailCubit>()
                      .guncelle(widget.kisi.kisiid, kisiAd.text, kisiTel.text);
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
