import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{

  LoginBloc():super(const LoginStates()){
    on<EmailChanged>(emailChanged);
    on<PasswordChanged>(passwordChanged);

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
}