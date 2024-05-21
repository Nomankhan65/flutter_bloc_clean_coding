import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_coding/config/bloc/login_bloc.dart';
import 'package:flutter_bloc_clean_coding/config/views/login/widgets/email_input_widget.dart';
import 'package:flutter_bloc_clean_coding/config/views/login/widgets/password_input_widget.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login screen'),
        automaticallyImplyLeading: false,
      ),
      body:BlocProvider(create: (_)=>loginBloc,
      child:  Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                InputEmailWidget(emailFocusNode: emailFocusNode),
                const SizedBox(height:20,),
                PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(height:20,),
                LoginButtonWidget(formKey: _formKey),
              ],
            ),
          )),)
    );
  }
}
