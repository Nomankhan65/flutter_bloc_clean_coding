import 'package:equatable/equatable.dart';
import 'login_bloc.dart';

abstract class LoginEvents extends Equatable{
  const LoginEvents();

  @override
  List<Object> get props=>[];


}

class EmailChanged extends LoginEvents{
  final String email;
  const EmailChanged({required this.email});

  @override
  List<Object> get props=>[email];
}

class PasswordChanged extends LoginEvents{
  final String password;
  const PasswordChanged({required this.password});

  @override
  List<Object> get props=>[password];
}

class PasswordUnfocused extends LoginEvents{

}

class LoginButton extends LoginEvents{

}


