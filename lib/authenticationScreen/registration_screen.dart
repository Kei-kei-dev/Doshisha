import 'dart:io';

import 'package:doshisha/controllers/authentication_controller.dart';
import 'package:doshisha/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();
  TextEditingController gradeTextEditingController = TextEditingController();
  TextEditingController facultyTextEditingController = TextEditingController();
  TextEditingController departmentTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();

  // Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();

  // Life style
  TextEditingController interestTextEditingController = TextEditingController();
  TextEditingController clubTextEditingController = TextEditingController();
  TextEditingController zodiacTextEditingController = TextEditingController();
  TextEditingController bloodTypeTextEditingController = TextEditingController();
  TextEditingController personalityTextEditingController = TextEditingController();
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController exerciseTextEditingController = TextEditingController();
  TextEditingController dietaryRestrictionTextEditingController = TextEditingController();
  TextEditingController partTimeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController = TextEditingController();
  // Background -Cultural values
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController languageSpokenTextEditingController = TextEditingController();

  bool showProgressbar = false;

  var authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),

              const Text(
                "新規アカウント作成",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "さあ、始めよう。",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              // choose image circle avatar
              authenticationController.imageFile == null ?
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    "images/profile_avatar.jpg"
                ),
                backgroundColor: Colors.black,
              ) : Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: FileImage(
                      File(
                        authenticationController.imageFile!.path,
                      ),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async{
                      await authenticationController.pickImageFileFromGallery();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  IconButton(
                    onPressed: () async {
                      await authenticationController.captureImageFileFromPhoneCamera();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              // personal info
              const Text(
                "personal Info:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              // name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "名前",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),


              // email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "メールアドレス",
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
                  labelText: "パスワード",
                  iconData: Icons.lock_outlined,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // age
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "年齢",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // gender
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: genderTextEditingController,
                  labelText: "性別",
                  iconData: Icons.person_pin,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // grade
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: gradeTextEditingController,
                  labelText: "学年",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // faculty
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: facultyTextEditingController,
                  labelText: "学部",
                  iconData: Icons.grade_rounded,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // department
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: departmentTextEditingController,
                  labelText: "学科",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),


              // city
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "出身地",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // country
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "国",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // profileHeading
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "自己紹介",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),



              // Appearance
              const Text(
                "Appearance:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              // height
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: heightTextEditingController,
                  labelText: "身長",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // weight
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: weightTextEditingController,
                  labelText: "体重",
                  iconData: Icons.table_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // bodyType
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: "体型",
                  iconData: Icons.type_specimen,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // Life style
              const Text(
                "Life style:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              // interest
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: interestTextEditingController,
                  labelText: "興味",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // club
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: clubTextEditingController,
                  labelText: "部活/サークル",
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // zodiac
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: zodiacTextEditingController,
                  labelText: "星座",
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // blood type
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: bloodTypeTextEditingController,
                  labelText: "血液型",
                  iconData: Icons.business_center,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // personality
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: personalityTextEditingController,
                  labelText: "mbti",
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // drink
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  labelText: "お酒",
                  iconData: Icons.local_drink_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // smoke
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: smokeTextEditingController,
                  labelText: "タバコ",
                  iconData: Icons.smoking_rooms,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // exercise
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: exerciseTextEditingController,
                  labelText: "運動",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // dietary restrictions
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: dietaryRestrictionTextEditingController,
                  labelText: "食事制限",
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // part-time
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: partTimeTextEditingController,
                  labelText: "バイト",
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // livingSituation
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: livingSituationTextEditingController,
                  labelText: "生活状況",
                  iconData: CupertinoIcons.person_2_square_stack,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // lookingForInaPartner
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  labelText: "異性に求めるものは？",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),


              // relationshipYouAreLookingFor
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: relationshipYouAreLookingForTextEditingController,
                  labelText: "アプリを使う目的は？",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // Background - cultural Values
              const Text(
                "Background - cultural Values:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              // nationality
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nationalityTextEditingController,
                  labelText: "国籍",
                  iconData: Icons.flag_circle_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),


              // languageSpoken
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: languageSpokenTextEditingController,
                  labelText: "話せる言語",
                  iconData: CupertinoIcons.person_badge_plus_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),


              // create account button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )
                ),
                child: InkWell(
                  onTap: () async
                  {
                    if(authenticationController.imageFile != null)
                    {
                      // 全部項目埋めておかないとアカウントが作れないようになっている↓
                      if(
                          // personal info
                          nameTextEditingController.text.trim().isNotEmpty
                          && emailTextEditingController.text.trim().isNotEmpty
                          && passwordTextEditingController.text.trim().isNotEmpty
                          && ageTextEditingController.text.trim().isNotEmpty
                          && genderTextEditingController.text.trim().isNotEmpty
                          && gradeTextEditingController.text.trim().isNotEmpty
                          && facultyTextEditingController.text.trim().isNotEmpty
                          && departmentTextEditingController.text.trim().isNotEmpty
                          && cityTextEditingController.text.trim().isNotEmpty
                          && countryTextEditingController.text.trim().isNotEmpty
                          && profileHeadingTextEditingController.text.trim().isNotEmpty

                              // Appearance
                          && heightTextEditingController.text.trim().isNotEmpty
                          && weightTextEditingController.text.trim().isNotEmpty
                          && bodyTypeTextEditingController.text.trim().isNotEmpty

                              // Life style
                          && interestTextEditingController.text.trim().isNotEmpty
                          && clubTextEditingController.text.trim().isNotEmpty
                          && zodiacTextEditingController.text.trim().isNotEmpty
                          && bloodTypeTextEditingController.text.trim().isNotEmpty
                          && personalityTextEditingController.text.trim().isNotEmpty
                          && drinkTextEditingController.text.trim().isNotEmpty
                          && smokeTextEditingController.text.trim().isNotEmpty
                          && exerciseTextEditingController.text.trim().isNotEmpty
                          && dietaryRestrictionTextEditingController.text.trim().isNotEmpty
                          && partTimeTextEditingController.text.trim().isNotEmpty
                          && livingSituationTextEditingController.text.trim().isNotEmpty
                          && lookingForInaPartnerTextEditingController.text.trim().isNotEmpty
                          && relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty

                              // Background - Cultural Values
                          && nationalityTextEditingController.text.trim().isNotEmpty
                          && languageSpokenTextEditingController.text.trim().isNotEmpty
                      )
                      {
                        setState(() {
                          showProgressbar = true;
                        });

                        await authenticationController.createNewUserAccount(
                          // personal info
                          authenticationController.profileImage!,
                          emailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim(),
                          nameTextEditingController.text.trim(),
                          ageTextEditingController.text.trim(),
                          genderTextEditingController.text.trim(),
                          gradeTextEditingController.text.trim(),
                          facultyTextEditingController.text.trim(),
                          departmentTextEditingController.text.trim(),
                          cityTextEditingController.text.trim(),
                          countryTextEditingController.text.trim(),
                          profileHeadingTextEditingController.text.trim(),

                            // Appearance
                            heightTextEditingController.text.trim(),
                            weightTextEditingController.text.trim(),
                            bodyTypeTextEditingController.text.trim(),

                            // Life style
                            interestTextEditingController.text.trim(),
                            clubTextEditingController.text.trim(),
                            zodiacTextEditingController.text.trim(),
                            bloodTypeTextEditingController.text.trim(),
                            personalityTextEditingController.text.trim(),
                            drinkTextEditingController.text.trim(),
                            smokeTextEditingController.text.trim(),
                            exerciseTextEditingController.text.trim(),
                            dietaryRestrictionTextEditingController.text.trim(),
                            partTimeTextEditingController.text.trim(),
                            livingSituationTextEditingController.text.trim(),
                            lookingForInaPartnerTextEditingController.text.trim(),
                            relationshipYouAreLookingForTextEditingController.text.trim(),

                            // Background - Cultural Values
                            nationalityTextEditingController.text.trim(),
                            languageSpokenTextEditingController.text.trim(),

                        );

                        setState(() {
                          showProgressbar = false;
                          authenticationController.imageFile = null;
                        });


                      }
                      else
                        {
                          Get.snackbar("A Field is empty", "Please fill out all field in text fields");
                        }
                    }
                    else
                      {
                        Get.snackbar("image File Missing", "Please pick image from galley or capture with camera");
                      }
                  },

                  child: const Center(
                    child: Text(
                      "Create Account",
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

              // already have an account login here button'
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.back();
                    },

                    child: const Text(
                      "Login Here",
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
