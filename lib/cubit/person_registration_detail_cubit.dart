import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler/repo/personsdao.dart';

class PersonRegistrationDetailCubit extends Cubit<void> {
  PersonRegistrationDetailCubit() : super(0);

  var prepo = Persondao();
  Future<void> guncelle(int kisiid, String kisiad, String kisiTel) async {
    await prepo.kisiGuncelle(kisiid, kisiad, kisiTel);
  }
}
