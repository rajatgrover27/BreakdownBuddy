import 'package:breakdown_assistant/signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'base/themes/app_decoration.dart';
import 'base/widgets/custom_text_form_field.dart';
import 'mapScreen.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key})
      : super(
          key: key,
        );

  @override
  LoginScreenPageState createState() => LoginScreenPageState();
}

class LoginScreenPageState extends State<LoginScreenPage>
    with AutomaticKeepAliveClientMixin<LoginScreenPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // Set this to false to prevent scrolling
        body: Stack(
          children: [
            // Background image positioned at the bottom
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

            // Form and other widgets on top of the background
            SingleChildScrollView(
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
                        SizedBox(height: 200),
                        Image.asset(
                          'assets/images/logo.png',
                          height: 50,
                          fit: BoxFit
                              .fitHeight, // Adjust the BoxFit property as needed
                        ),
                        SizedBox(height: 70),
                        Container(
                          decoration: AppDecoration.outlineGray.copyWith(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: CustomTextFormField(
                              controller: emailController,
                              hintText: "Email Address",
                              textInputType: TextInputType.emailAddress,
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(height: 31),
                        Container(
                          decoration: AppDecoration.outlineGray.copyWith(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: CustomTextFormField(
                              controller: passwordController,
                              hintText: "Password",
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              obscureText: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                            height: 50,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MapScreen(), // Replace with the screen you want to navigate to
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
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors
                                      .white, // Set text color to white for visibility
                                ),
                              ),
                            )),
                        SizedBox(height: 45),
                        Container(
                            height: 50,
                            width: 350,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpScreen(), // Replace with the screen you want to navigate to
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
