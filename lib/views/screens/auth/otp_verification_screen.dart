import 'package:bula/views/screens/auth/sign_up_screen.dart';
import 'package:bula/views/screens/auth/verification_successful_screen.dart';
import 'package:bula/views/widgets/auth/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/auth/otp_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({required verificationId ,super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final pinController = TextEditingController();

  final FirebaseAuth _auth=FirebaseAuth.instance;

  //get verificationId => verificationId;

  @override
  Widget build(BuildContext context) {
    var smscode = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
            children: [
              const Text(
                'Enter Verification Code',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.h),
              const Text(
                'Enter code that we have sent to your mobile  number ........705',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                ),
              ),
              SizedBox(height: 4.h),
              
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                onChanged: (value){
                  smscode=value;
                },
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(height: 4.h),
              CustomButton(
                function: () async {
                  try{
                    PhoneAuthCredential credential=PhoneAuthProvider.credential(
                        verificationId: SignUpScreen.verify,
                        smsCode: smscode
                    );
                    await _auth.signInWithCredential(credential);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => VerificationSuccessfulScreen()));
                  }catch(e){

                  }

                },
                name: "submit",
                isActive: false,
              ),
              SizedBox(height: 3.h),
              const Text(
                'Resend code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF289BF6),
                  fontSize: 16,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.50,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child:Image.asset(
              "assets/images/i_down.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              "assets/images/i_up.png",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
  // Widget animatedBorders() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Pinput(
  //       controller: pinController,
  //       fieldsCount: 6,
  //       //eachFieldHeight: 50.0,
  //       showCursor: true,
  //       onSubmitted: (String pin) => _showSnackBar(pin),
  //       submittedFieldDecoration: BoxDecoration(
  //         border: Border.all(color: Colors.black),
  //         borderRadius: BorderRadius.circular(15.0),
  //       ).copyWith(
  //         borderRadius: BorderRadius.circular(20.0),
  //       ),
  //       selectedFieldDecoration: BoxDecoration(
  //         color: Colors.green,
  //         border: Border.all(color: Colors.black),
  //         borderRadius: BorderRadius.circular(15.0),
  //       ),
  //       followingFieldDecoration: BoxDecoration(
  //         border: Border.all(color: Colors.black),
  //         borderRadius: BorderRadius.circular(15.0),
  //       ).copyWith(
  //         borderRadius: BorderRadius.circular(5.0),
  //         border: Border.all(
  //           color: Colors.black,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
