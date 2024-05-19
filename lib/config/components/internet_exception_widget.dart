import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_coding/config/components/my_button.dart';

class InternetExceptionWidget extends StatelessWidget {
  VoidCallback onPress;
    InternetExceptionWidget({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:MediaQuery.of(context).size.height*.15,),
        const Icon(Icons.cloud_off,color:Colors.redAccent,size:50,),
        SizedBox(height:MediaQuery.of(context).size.height*.03,),
        const Center(child: Text('No Internet Connection')),
        SizedBox(height:MediaQuery.of(context).size.height*.03,),
        MyButton(title:'Retry', onTap: onPress)

      ],
    );
  }
}
