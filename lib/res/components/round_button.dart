import 'package:flutter/material.dart';
import 'package:mvvm/res/components/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(fontSize: 18, color: AppColors.blackColor),
                  )),
        decoration: BoxDecoration(
          color: AppColors.buttoncolor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

 
//  final String title;
//   final bool loading;
//   final VoidCallback onPress;
//   Container(
//      
//     )