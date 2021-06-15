import 'package:chilli/bloc/blocDelegate.dart';
import 'package:chilli/ui/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  
  runApp(Home());
}