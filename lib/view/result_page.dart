import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant.dart';
import '../utils/text_utile.dart';

class ResultPage extends StatelessWidget {
   double result;
   bool isMale;
  double age;
   ResultPage({required this.result, required this.isMale, required this.age});

   String get resultPhrase {
     String resultText = '';
     if (result >= 30) {
       resultText = "Obese";
     } else if (result > 25 && result < 30) {
       resultText = "Over Weight";
     } else if (result >= 18.5 && result <= 24.9) {
       resultText = "Normel";
     } else {
       resultText = "Thin";
     }

     return resultText;
   }
   String get resultImage {
     String resultUrl = '';
     if (result >= 30) {
       resultUrl = "assets/icons/obesity.png";
     } else if (result > 25 && result < 30) {
       resultUrl = "assets/icons/over_weight.png";
     } else if (result >= 18.5 && result <= 24.9) {
       resultUrl = "assets/icons/normal.png";
     } else {
       resultUrl = "assets/icons/thin.png";
     }

     return resultUrl;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Constants.mainColor,
          statusBarBrightness: Brightness.dark,
        ),
        title: Center(
          child: KTextUtils(
            text: "BMI Result",
            color: Constants.textApparColor,
            size: 26,
            fontWeight: FontWeight.w600,
            textDecoration: TextDecoration.none,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Center(child: Image.asset("$resultImage"))),
          const SizedBox(height: 30,),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KTextUtils(
                      text: "Gender: ${isMale ? "Male" : "Female"}",
                      color: Constants.blackColor,
                      size: 26,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.none,
                    ),
                    KTextUtils(
                      text: "Result BNI : ${result.toStringAsFixed(1)}",
                      color: Constants.blackColor,
                      size: 26,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.none,
                    ),
                    KTextUtils(
                      text: "Healthiness : $resultPhrase",
                      color: Constants.blackColor,
                      size: 26,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.none,
                    ),
                    KTextUtils(
                      text: "Age : ${age.toInt()}",
                      color: Constants.blackColor,
                      size: 26,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.none,
                    ),

              ]),
            ),
          ),
        ],
      ),
    );
  }
}
