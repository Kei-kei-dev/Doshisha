import 'package:doshisha/authenticationScreen/registration_screen.dart';
import 'package:doshisha/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressbar = false;
  var controllerAuth = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 120,
              ),

              Image.asset(
                  "images/logo.png",
                width: 200,
              ),

              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Text(
                "login now to find your best match",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 28,
              ),

              // email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // password
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "password",
                  iconData: Icons.lock_outlined,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // login button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )
                ),
                child: InkWell(
                  onTap: () async
                  {
                    if(emailTextEditingController.text.trim().isNotEmpty
                    && passwordTextEditingController.text.trim().isNotEmpty)
                      {
                        setState(() {
                          showProgressbar = true;
                        });

                        await controllerAuth.loginUser(
                            emailTextEditingController.text.trim(),
                            passwordTextEditingController.text.trim()
                        );

                        setState(() {
                          showProgressbar = false;
                        });
                      }
                    else {
                      Get.snackbar("Email/Pssword is Missing", "Please fill all fields");
                    }
                  },

                  child: const Center(
                    child: Text(
                      "login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              // don't have an account create here button'
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.to(RegistrationScreen());
                    },

                    child: const Text(
                      "Create Here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              showProgressbar == true
                  ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              )
                  : Container(),

              const SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
