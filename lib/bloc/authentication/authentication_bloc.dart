import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chilli/repositories/userRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository}):assert (userRepository != null),
  _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialised();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted){
      yield* _mapAppStartedToState();
    } else if(event is LoggedIn){
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut){
      yield* _mapLoggedOutToState();
    }
  }

 Stream<AuthenticationState> _mapAppStartedToState() async* {
    try{
      final isSignedIn = await _userRepository.isSignedIn();
      if(isSignedIn){
        final uid = await _userRepository.getUser();
        final isFirsTime = await _userRepository.isFirstTime(uid);
        if(!isFirsTime) {
          yield AuthenticatedButNotSet(uid);
        } else{
          yield Authenticated(uid);
        }
      }else{
        yield Unauthenticated();
      }
    } catch(_){
      yield Unauthenticated();
    }
  }

 Stream<AuthenticationState> _mapLoggedInToState() async* {
    final isFirstTime = await _userRepository.isFirstTime(await _userRepository.getUser());
    if(!isFirstTime) {
      yield AuthenticatedButNotSet(await _userRepository.getUser());
    } else {
      yield Authenticated(await _userRepository.getUser());
    }
 }

 Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
 }
}
