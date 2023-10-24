import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler/repo/personsdao.dart';

class PersonRegistrationCubit extends Cubit<void> {
  PersonRegistrationCubit() : super(0);
  var prepo = Persondao();

  Future<void> kayit(String kisiad, String kisiTel) async {
    await prepo.kisiKayit(kisiad, kisiTel);
  }
}
