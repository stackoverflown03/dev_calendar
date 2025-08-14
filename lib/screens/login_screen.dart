import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

TextEditingController _mobile_no=TextEditingController();
TextEditingController _otp=TextEditingController();
String verificationId="";


class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    Future<bool> loginwithmobile() async{
      try{
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91${_mobile_no.text.trim()}',
          verificationCompleted: (PhoneAuthCredential credential){
            print("Verification completed!");
          },
      verificationFailed: (FirebaseAuthException e){
            print("Verification Failed");
            print("$e");
      },
      codeSent: (String _verificationId, int? resendToken){
            setState(() {
              verificationId=_verificationId;
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Verification code Sent"),
                ));
            print("Verification Code sent");
      },
      codeAutoRetrievalTimeout: (String verficationId){
            print("Timeout!");
      });
          return true;
    }
    catch(e){
        print("Error Logging in: $e");
        return false;
      }
      };

    Future<bool> verifyotp() async {
      try{
        PhoneAuthCredential credential=PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: _otp.text.trim(),
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        return true;
      }
      catch(e){
        print("Error verifying OTP: $e");
        return false;

      }
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login through OTP",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: _mobile_no,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Mobile Number',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ]
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: _otp,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter OTP',
              ),
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    bool sent = await loginwithmobile();
                    if (sent) {
                      print("OTP sent successfully");
                    } else {
                      print("Failed to send OTP");
                    }
                  },
                  child:Text("Send OTP") ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async{
                    bool result=await verifyotp();
                    if(result) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => homescreen()));
                    }
                    else{
                      print("Login failed");
                    }
                  },
                  child:Text("Veify OTP") ),
            )
          ],
        ),
      ),
    );
  }
}


