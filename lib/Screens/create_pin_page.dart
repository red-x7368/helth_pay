import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helth_pay/Screens/retype_pin_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../Components/round_edge_button.dart';
import '../constants.dart';
import 'package:helth_pay/Components/bottom_button.dart';

class CreatePINPage extends StatefulWidget {
  const CreatePINPage({Key? key}) : super(key: key);

  @override
  State<CreatePINPage> createState() => _CreatePINPageState();
}

class _CreatePINPageState extends State<CreatePINPage> {


  get textEditingController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(myGrey),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //   ),
      //   title: const Text(
      //     'Create PIN',
      //     style: TextStyle(color: Colors.black, fontSize: 15),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 110, bottom: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE4F1FE),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'lib/icons/key.svg',
                          color: Color(myBlue),
                        ),
                      ),
                    ),
                    // RoundedEdgeButton(
                    //   height: 50,
                    //   width: 50,
                    //   iconSize: 25,
                    //   child: Image.asset('lib/icons/key.svg',
                    //     color: currentTab == 0 ? Color(myBlue) : Colors.grey,),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Create PIN',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Change your PIN to help secure',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      'your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                      child: PinCodeTextField(
                        length: 4,
                        obscureText: false,
                        // animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          activeColor: Color(myBlue),
                          errorBorderColor: Color(myPink),
                          inactiveFillColor: Color(myGrey),
                          inactiveColor: Color(myGrey),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Colors.white,
                        ),
                        // animationDuration: Duration(milliseconds: 300),
                        // backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            var currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: (context),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                    child: GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){
                      return RetypePINPage();
                    },),);},
                        child: BottomButton(buttonTitle: 'Proceed')),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.buttonTitle,
    required this.buttonColor,
  }) : super(key: key);

  final Widget buttonTitle;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 2,
          child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: buttonColor, //Color(0xFFEBEFF3),
                borderRadius: BorderRadius.circular(8),
              ),
              // child: isIcon(buttonTitle!) ? myIcon : buttonTitle,
              child: Center(child: Flexible(child: buttonTitle))),
        ),
      ),
    );
  }
}
