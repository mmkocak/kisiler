import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler/cubit/home_cubit.dart';
import 'package:kisiler/cubit/person_registration_cubit.dart';
import 'package:kisiler/cubit/person_registration_detail_cubit.dart';
import 'package:kisiler/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PersonRegistrationCubit()),
        BlocProvider(create: (context) => PersonRegistrationDetailCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
