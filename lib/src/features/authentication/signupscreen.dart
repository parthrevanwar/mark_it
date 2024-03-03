import 'package:flutter/material.dart';
import 'package:mark_it/src/features/authentication/otp_verification.dart';
import 'package:mark_it/src/features/authentication/signin_screen.dart';
import 'package:mark_it/src/features/authentication/social_login_buttons.dart';

import '../common widgets/custom_eleveted_button.dart';
import '../common widgets/custom_text_field.dart';
import '../utils/theme/theme.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _usernamecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color(0xFFE8ECF4),
                ),
              ),
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_arrow_left_sharp),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hello! Register to get\nstarted",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
                textcontroller: _usernamecontroller,
                hinttext: "Enter a username",
                labeltext: "Username"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
                textcontroller: _emailcontroller,
                hinttext: "Enter an email",
                labeltext: "Email"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
                textcontroller: _passwordcontroller,
                hinttext: "Enter your password",
                labeltext: "Password"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
                textcontroller: _confirmpasswordcontroller,
                hinttext: "Confirm your password",
                labeltext: "Confirm Password"),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 30),
            CustomElevetedButtonDark(press: (){
            }, name: "Sign up"),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Expanded(child: Divider()),
              Text(
                "    Or Register with    ",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppTheme.colors.lightgray,
                    ),
              ),
              Expanded(child: Divider()),
            ]),
            SizedBox(
              height: 20,
            ),
            SocialLogin(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.colors.black,
                      ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => SignInScreen()));
                  },
                  child: Text(
                    "Login Now",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.colors.Primary,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
