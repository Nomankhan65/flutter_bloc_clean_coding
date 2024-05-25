part of 'login_bloc.dart';

class LoginStates extends Equatable{

  final String email;
  final String password;
  final PostApiStatus postApiStatus;
  final String error;
  final String message;
  const LoginStates({
    this.email='',
    this.password='',
    this.postApiStatus=PostApiStatus.initial,
    this.error='',
    this.message=''
});

  LoginStates copyWith({String? email,String? password,final PostApiStatus? postApiStatus,String? error,String? message}){
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
  @override
  List<Object?> get props => [email,password,postApiStatus,error,message];

}