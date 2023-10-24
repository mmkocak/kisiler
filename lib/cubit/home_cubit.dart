import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler/entity/persons.dart';
import 'package:kisiler/repo/personsdao.dart';

class HomeCubit extends Cubit<List<Persons>> {
  HomeCubit() : super(<Persons>[]);
  var prepo = Persondao();

  Future<void> kisilerYukle() async {
    var liste = await prepo.tumKisileriAl();
    emit(liste);
  }

  Future<void> kisilerara(aramaKelimesi) async {
    var liste = await prepo.kisiAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int kisiiD) async {
    await prepo.kisiSil(kisiiD);
    await kisilerYukle();
  }
}
