import 'package:breakdown_assistant/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'base/themes/custom_text_style.dart';
import 'base/themes/theme_helper.dart';
import 'base/widgets/custom_text_form_field.dart';
import '../../base/themes/app_decoration.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}


class SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define FocusNodes for each text field
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  void navigateToSignInScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreenPage(),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the FocusNodes when they are no longer needed
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Set this to true
        body: Stack(
          children: [
            // Background image container
            Positioned(
              top: 0,
              left: 0,
              width: screenSize.width,
              height: screenSize.height,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 34,
                        top: 13,
                        right: 40,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 57,
                              right: 47,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                          SizedBox(height: 90),
                          // First Name Text Field
                          Focus(
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                firstNameFocusNode.requestFocus();
                              }
                            },
                            child: Container(
                              decoration: AppDecoration.outlineGray.copyWith(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CustomTextFormField(
                                  prefix: Icon(Icons.person),
                                  hintText: "First Name",
                                  textInputAction: TextInputAction.done,
                                  focusNode: firstNameFocusNode,
                                  controller: firstNameController,
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Last Name Text Field
                          Focus(
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                lastNameFocusNode.requestFocus();
                              }
                            },
                            child: Container(
                              decoration: AppDecoration.outlineGray.copyWith(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CustomTextFormField(
                                  prefix: Icon(Icons.person),
                                  hintText: "Last Name",
                                  textInputAction: TextInputAction.done,
                                  focusNode: lastNameFocusNode,
                                  controller: lastNameController,
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Username Text Field
                          Focus(
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                usernameFocusNode.requestFocus();
                              }
                            },
                            child: Container(
                              decoration: AppDecoration.outlineGray.copyWith(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CustomTextFormField(
                                  prefix: Icon(Icons.person),
                                  hintText: "Username",
                                  textInputAction: TextInputAction.done,
                                  focusNode: usernameFocusNode,
                                  controller: usernameController,
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Email Text Field
                          Focus(
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                emailFocusNode.requestFocus();
                              }
                            },
                            child: Container(
                              decoration: AppDecoration.outlineGray.copyWith(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CustomTextFormField(
                                  prefix: Icon(Icons.email),
                                  hintText: "Email Address",
                                  textInputType: TextInputType.emailAddress,
                                  focusNode: emailFocusNode,
                                  controller: emailController,
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Password Text Field
                          Focus(
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                passwordFocusNode.requestFocus();
                              }
                            },
                            child: Container(
                              decoration: AppDecoration.outlineGray.copyWith(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CustomTextFormField(
                                  prefix: Icon(Icons.password_rounded),
                                  hintText: "Password",
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  focusNode: passwordFocusNode,
                                  controller: passwordController,
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 28),
                          Container(
                              height: 50,
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          LoginScreenPage(), // Replace with the screen you want to navigate to
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors
                                        .white, // Set text color to white for visibility
                                  ),
                                ),
                              )),
                          SizedBox(height: 38),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account?.",
                                  style: theme.textTheme.titleLarge,
                                ),
                                TextSpan(
                                  text: "Login",
                                  style: CustomTextStyles.titleLargePrimary,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = navigateToSignInScreen,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
