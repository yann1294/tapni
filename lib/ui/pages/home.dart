import 'package:chilli/bloc/authentication/authentication_bloc.dart';
import 'package:chilli/repositories/userRepository.dart';
import 'package:chilli/ui/pages/login.dart';
import 'package:chilli/ui/pages/signUp.dart';
import 'package:chilli/ui/pages/splash.dart';
import 'package:chilli/ui/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    // TODO: implement initState
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authenticationBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is Uninitialised) {
              return Splash();
            } else
              return Login(userRepository: _userRepository);
          },
        ),
      ),
    );
  }
}
