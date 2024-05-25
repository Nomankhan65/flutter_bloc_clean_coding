import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean_coding/respository/auth/login_repo.dart';

import '../utils/enums.dart';
 part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{

  final loginRepo=LoginRepo();
  LoginBloc():super(const LoginStates()){
    on<EmailChanged>(emailChanged);
    on<PasswordChanged>(passwordChanged);
    on<LoginApi>(_onLogin);

  }

  emailChanged(EmailChanged event,Emitter<LoginStates>emitter){
    print(event.email);
    emitter(state.copyWith(
      email:event.email
    ));
  }

  passwordChanged(PasswordChanged event,Emitter<LoginStates>emitter){
    emitter(state.copyWith(
        email:event.password
    ));
  }

  _onLogin(LoginApi event,Emitter<LoginStates>emitter)async{
    Map data={'email':state.email,'password':state.password};
    emitter(state.copyWith(
      postApiStatus:PostApiStatus.loading,
    ));
    await loginRepo.loginApi(data).then((value){
      if(value.error.isNotEmpty){
        emitter(state.copyWith(
          postApiStatus:PostApiStatus.error,
          message:value.error.toString()
        ));
        print('login success');
      }else{
        emitter(state.copyWith (
            postApiStatus:PostApiStatus.success,
            message:'login success',
        ));
      }

    }).onError((error, stackTrace) {
      emitter(state.copyWith(
        error:error.toString(),
        message:error.toString(),
        postApiStatus:PostApiStatus.error
      ));
    });

  }
}