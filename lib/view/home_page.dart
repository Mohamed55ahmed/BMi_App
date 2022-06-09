import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbi_app_new/constant.dart';
import 'package:mbi_app_new/utils/text_utile.dart';
import 'package:mbi_app_new/view/result_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static bool isMale = true;
  double heightVal = 120.0;
  double weightVal = 55.0;
  double ageVal = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blackColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Constants.mainColor,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Constants.mainColor,
        leading: Center(
          child: KTextUtils(
            text: "BMI",
            color: Constants.textApparColor,
            size: 26,
            fontWeight: FontWeight.w600,
            textDecoration: TextDecoration.none,
          ),
        ),
        title: Center(
          child: KTextUtils(
            text: "Body Mass Index",
            color: Constants.textApparColor,
            size: 26,
            fontWeight: FontWeight.w600,
            textDecoration: TextDecoration.none,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Constants.whiteColor,
                  context: context,
                  builder: (_) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.cancel)),
                              const Text(
                                "للمساعدة",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 30, color: Constants.grayColor),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "هذا البرنامج يقوم بحساب مؤشر كتلة الجسم ‏ هو قيمة رياضية تسمح بتقدير كتلة جسم الإنسان وذلك بالأخذ بالوزن والطول بعين الاعتبار",
                            style: TextStyle(
                              color: Constants.grayColor,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        InkWell(
                          child: const SelectableText(
                            "Eng\\Mohamed Ahmed",
                          ),
                          onTap: () {
                            FlutterClipboard.copy('hello flutter friends')
                                .then((value) {
                              // ScaffoldMessenger.of(_).showSnackBar(
                              //   SnackBar(
                              //     content: const Text('Copy....'),
                              //   ),
                              // );
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircleAvatar(
                                  child: Icon(Icons.facebook),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            launcherInBrowser();
                            // launcherInBrowser("https://www.facebook.com/profile.php?id=100007422464467");
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.info_outline,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [

          /// Male ,female
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ///male
                  Expanded(
                    child: GestureDetector(
                       onTap: (){
                         setState(() {
               isMale=true;
                         });
                       },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/man.png",
                                height: 60, width: 60, color: Constants
                                    .whiteColor),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Male",
                              style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isMale?Constants.blueColor:Constants.grayColor
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  ///female
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/female.png",
                                height: 60, width: 60, color: Constants
                                    .whiteColor),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "female",
                              style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isMale?Constants.grayColor:Constants.blueColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///slider height
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Constants.grayColor
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                          color: Constants.whiteColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(
                          "${heightVal.toInt()}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Constants.whiteColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        const Text(
                          "cm",
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(
                        value: heightVal,
                        max: 240.0,
                        min: 80,
                        onChanged:(value){
                          setState(() {
                            heightVal=value;
                          });
                        },
                      activeColor: Constants.redColor,
                        ),
                  ],
                ),
              ),
            ),
          ),
          //weight , age
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Constants.grayColor
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                "${weightVal.toInt()}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              const Text(
                                "kg",
                                style: TextStyle(
                                    color: Constants.whiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Slider(
                            value: weightVal,
                            max: 240.0,
                            min: 30.0,
                            onChanged:(value){
                              setState(() {
                                weightVal=value;
                              });
                            },
                            activeColor: Constants.redColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  weightVal--;
                                });
                              }, icon: Icon(Icons.remove_circle_outline_outlined,color: Constants.whiteColor,size: 40,)),
                               const SizedBox(width: 20,),
                              IconButton(onPressed: (){
                                setState(() {
                                  weightVal++;
                                });
                              }, icon: Icon(Icons.add_circle_outline_outlined,color: Constants.whiteColor,size: 40,)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                const  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Constants.grayColor
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                "${ageVal.toInt()}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              const Text(
                                "year",
                                style: TextStyle(
                                    color: Constants.whiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Slider(
                            value: ageVal,
                            max: 120.0,
                            min: 10.0,
                            onChanged:(value){
                              setState(() {
                                ageVal=value;
                              });
                            },
                            activeColor: Constants.redColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  ageVal--;
                                });
                              }, icon: Icon(Icons.remove_circle_outline_outlined,color: Constants.whiteColor,size: 40,)),
                              const SizedBox(width: 20,),
                              IconButton(onPressed: (){
                                setState(() {
                                  ageVal++;
                                });

                              }, icon: Icon(Icons.add_circle_outline_outlined,color: Constants.whiteColor,size: 40,)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Constants.redColor,
            child: MaterialButton(
              height: 50,
              onPressed: () {
                var result=weightVal/pow(heightVal/100,2);
                Navigator.push(context,
                  MaterialPageRoute (
                    builder: (BuildContext context) => ResultPage(age: ageVal,isMale: isMale,result: result),
                  ),);
              },
              child: const Text(
                "CALCULATE",
                style: TextStyle(color: Constants.whiteColor, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }

  launcherInBrowser() async {
    const url = 'https://www.facebook.com/profile.php?id=100007422464467';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(
        url,
        // forceSafariVC: false,
        // forceWebView: false,
        // headers: <String,String>{'header_key':'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}



