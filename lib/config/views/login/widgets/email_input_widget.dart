import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_coding/config/bloc/login_bloc.dart';
class InputEmailWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
               const InputEmailWidget({super.key,required this.emailFocusNode});
             @override
             Widget build(BuildContext context) {
               return BlocBuilder<LoginBloc,LoginStates>(
                   buildWhen:(current,previous)=>current.email!=previous.email,
                   builder: (context,states){
                 return TextFormField(
                   keyboardType: TextInputType.emailAddress,
                   focusNode: emailFocusNode,
                   decoration: const InputDecoration(
                       hintText: 'Email', border: OutlineInputBorder()),
                   onChanged: (value) {
                     context.read<LoginBloc>().add(EmailChanged(email:value));
                   },
                   validator: (value) {
                     if (value!.isEmpty) {
                       return 'Enter email';
                     }
                     return null;
                   },
                   onFieldSubmitted: (value) {},
                 );
               });
             }
           }
