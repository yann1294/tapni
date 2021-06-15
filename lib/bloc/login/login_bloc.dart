import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chilli/repositories/userRepository.dart';
import 'package:chilli/ui/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
      :assert(userRepository!=null), _userRepository = userRepository, super(null);


  @override
  LoginState get initialState => LoginState.empty();


  @override
  Stream<Transition<LoginEvent,LoginState>> transformEvents(
      Stream<LoginEvent> events,
       Function(LoginEvent event) next,
      ) {
      final nonDebounceStream = events.where((event){
        return (event is! EmailChanged || event is! PasswordChanged);
      });
      final debounceStream = events.where((event){
        return (event is EmailChanged || event is PasswordChanged );
      }).debounceTime(Duration(milliseconds: 300));
      return super.transformEvents(nonDebounceStream.mergeWith([debounceStream]),next);
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is EmailChanged){
      yield* _mapEmailChangedToState(event.email);
    } else if(event is PasswordChanged){
      yield* _mapPasswordChangedToState(event.password);
    } else if(event is LoginWithCredentials){
      yield* _mapLoginWithCredentialsToState(email: event.email, password: event.password);
    }
  }

 Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
 }

 Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
 }

 Stream<LoginState> _mapLoginWithCredentialsToState({String email, String password}) async* {
    yield LoginState.loading();

    try{
      await _userRepository.signInWithEmail(email, password);
      yield LoginState.success();
    } catch(_){
      LoginState.failure();
    }
 }
}


