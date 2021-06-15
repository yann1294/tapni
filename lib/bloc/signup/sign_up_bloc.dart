import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chilli/repositories/userRepository.dart';
import 'package:chilli/ui/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  UserRepository _userRepository;

  SignUpBloc({@required UserRepository userRepository})
      :assert(userRepository!=null), _userRepository = userRepository, super(null);


  @override
  SignUpState get initialState => SignUpState.empty();

  @override
  Stream<Transition<SignUpEvent,SignUpState>> transformEvents(
      Stream<SignUpEvent> events,
      Function(SignUpEvent event) next,
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
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if(event is EmailChanged){
      yield* _mapEmailChangedToState(event.email);
    } else if(event is PasswordChanged){
      yield* _mapPasswordChangedToState(event.password);
    } else if(event is SignUpWithCredentialsPressed){
      yield* _mapSignUpWithCredentialsPressedToState(email: event.email, password: event.password);
    }
  }

  Stream<SignUpState> _mapEmailChangedToState(email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<SignUpState>_mapPasswordChangedToState(password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

 Stream<SignUpState> _mapSignUpWithCredentialsPressedToState({String email, String password}) async* {
   yield SignUpState.loading();

   try{
     await _userRepository.signUpWithEmail(email, password);
     yield SignUpState.success();
   } catch(_){
     SignUpState.failure();
   }
 }


}