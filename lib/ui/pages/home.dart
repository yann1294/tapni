import 'package:chilli/bloc/authentication/authentication_bloc.dart';
import 'package:chilli/repositories/userRepository.dart';
import 'package:chilli/ui/pages/login.dart';
import 'package:chilli/ui/pages/profile.dart';
import 'package:chilli/ui/pages/signUp.dart';
import 'package:chilli/ui/pages/splash.dart';
import 'package:chilli/ui/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final UserRepository _userRepository;

  Home({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialised) {
            return Splash();
          }
          if (state is Authenticated) {
            return Tabs(userId: state.userId);
          }
          if (state is AuthenticatedButNotSet) {
            return Profile(
              userRepository: _userRepository,
              userId: state.userId,
            );
          }
          if (state is Unauthenticated) {
            return Login(
              userRepository: _userRepository,
            );
          } else
            return Container();
        },
      ),
    );
  }
}
