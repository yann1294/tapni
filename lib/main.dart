import 'package:chilli/bloc/authentication/authentication_bloc.dart';
import 'package:chilli/bloc/blocDelegate.dart';
import 'package:chilli/repositories/userRepository.dart';
import 'package:chilli/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();

  // await Firebase.initializeApp();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(BlocProvider(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: Home(userRepository: userRepository)));
}
