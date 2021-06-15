import 'package:chilli/bloc/signup/sign_up_bloc.dart';
import 'package:chilli/repositories/userRepository.dart';
import 'package:chilli/ui/constants.dart';
import 'package:chilli/ui/widgets/signUpForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {

  final UserRepository _userRepository;

  SignUp({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  SignUpBloc _signUpBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    // TODO: implement initState
    _signUpBloc = SignUpBloc(userRepository: _userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: BlocProvider<SignUpBloc>(
        create: (context)=> SignUpBloc(userRepository: _userRepository),
        child: SignUpForm(
          userRepository: _userRepository,
        ),
      ),
    );
  }
}
