part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email});


  @override
  List<Object> get props => [email];


  @override
  String toString()=> 'EmailChanged {email : $email}';
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password});


  @override
  List<Object> get props => [password];


  @override
  String toString()=> 'PasswordChanged {password : $password}';
}

class Submitted extends LoginEvent {
  final String email;
  final String password;

  Submitted({ @required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

}


class LoginWithCredentials extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentials({ @required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];


}