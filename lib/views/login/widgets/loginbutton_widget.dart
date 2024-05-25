import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_coding/utils/enums.dart';
import '../../../bloc/login_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginButtonWidget extends StatelessWidget {

  final formKey;
    LoginButtonWidget({super.key,required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginStates>(listener:(context,states){
      listenWhen: (current, previous) => current.postApiStatus != previous.postApiStatus;
      if(states.postApiStatus==PostApiStatus.loading){
        Fluttertoast.showToast(msg: 'Submitting');
      }else if(states.postApiStatus==PostApiStatus.success){
        Fluttertoast.showToast(msg:'success');
      }
      else if(states.postApiStatus==PostApiStatus.error){
        Fluttertoast.showToast(msg:states.error.toString());
      }
    },
    child:BlocBuilder<LoginBloc,LoginStates>(
        buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      builder: (context,states){
        return ElevatedButton(onPressed: (){
          if(formKey.currentState!.validate()){
            context.read<LoginBloc>().add(LoginApi());
          }
        }, child:states.postApiStatus==PostApiStatus.loading?const CircularProgressIndicator(): const Text('Login'));
      }),
    );

  }
}
