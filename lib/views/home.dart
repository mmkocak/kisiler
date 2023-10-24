import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler/cubit/home_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().kisilerYukle();
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
                  context.read<HomeCubit>().kisilerara(aramaSonucu);
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
                    context.read<HomeCubit>().kisilerYukle();
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
      body: BlocBuilder<HomeCubit, List<Persons>>(
        builder: (context, kisilerListesi) {
          if (kisilerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: kisilerListesi.length,
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
                      context.read<HomeCubit>().kisilerYukle();
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("${kisi.kidiad} - ${kisi.kisiTell}"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${kisi.kidiad} Silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      context
                                          .read<HomeCubit>()
                                          .sil(kisi.kisiid);
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
            context.read<HomeCubit>().kisilerYukle();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
