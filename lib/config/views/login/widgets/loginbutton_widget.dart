import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login_bloc.dart';

class LoginButtonWidget extends StatelessWidget {

  final formKey;
    LoginButtonWidget({super.key,required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginStates>(
        builder: (context,states){
          return ElevatedButton(onPressed: (){
            if(formKey.currentState!.validate()){
              context.read<LoginBloc>().add(LoginButton());
            }
          }, child: const Text('Login'));
        });

  }
}
