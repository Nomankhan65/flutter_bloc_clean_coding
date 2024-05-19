import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_coding/config/colors/app_colors.dart';

class MyButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const MyButton({super.key,required this.title,required this.onTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height:40,
        width:250,
        child: ElevatedButton(
          style:ElevatedButton.styleFrom(
            backgroundColor:AppColors.blueColor,
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(25),
            ),
          ),
            onPressed:widget.onTap, child:Text(widget.title,style:const TextStyle(color:AppColors.whiteColor),) ));
  }
}
