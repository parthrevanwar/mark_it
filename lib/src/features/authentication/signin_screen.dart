import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mark_it/src/features/authentication/signupscreen.dart';
import 'package:mark_it/src/features/common%20widgets/custom_eleveted_button.dart';
import 'package:mark_it/src/features/common%20widgets/custom_text_field.dart';
import 'package:mark_it/src/features/utils/theme/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

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
              "Welcome back! Glad\nto see you again!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                textcontroller: _emailcontroller,
                hinttext: "Enter your email",
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
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.colors.lightgray,
                      ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 30),
            CustomElevetedButton(press: (){}, name: "Login"),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Expanded(child: Divider()),
              Text(
                "    Or Login with    ",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppTheme.colors.lightgray,
                    ),
              ),
              Expanded(child: Divider()),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color(0xFFE8ECF4),
                      ),
                    ),
                    height: 100,
                    child: Image.asset("assets/icons/google.png"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color(0xFFE8ECF4),
                      ),
                    ),
                    height: 60,
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.colors.black,
                      ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => SignUpScreen()));
                  },
                  child: Text(
                    "Register Now",
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
