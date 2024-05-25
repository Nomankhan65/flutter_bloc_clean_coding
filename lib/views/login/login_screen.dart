import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../bloc/login_bloc.dart';
import 'widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc=LoginBloc();
  }
  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    loginBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login screen'),
        automaticallyImplyLeading: false,
      ),
      body:BlocProvider(create: (_)=>loginBloc,
      child:  Form(
        key:_formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                InputEmailWidget(emailFocusNode: emailFocusNode),
                const SizedBox(height:20,),
                PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(height:20,),
                LoginButtonWidget(formKey: _formKey,

                ),
              ],
            ),
          )),)
    );
  }
}
