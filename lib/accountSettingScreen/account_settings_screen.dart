import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doshisha/global.dart';
import 'package:doshisha/homeScreen/home_screen.dart';
import 'package:doshisha/widgets/custom_text_field_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}



class _AccountSettingsScreenState extends State<AccountSettingsScreen>
{
  bool uploading = false, next = false;
  final List<File> _image = [];
  List<String> urlsList = [];
  double val = 0;

  // personal info
  TextEditingController genderTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
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
  TextEditingController dietaryRestrictionsTextEditingController = TextEditingController();
  TextEditingController partTimeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController = TextEditingController();
  // Background -Cultural values
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController languageSpokenTextEditingController = TextEditingController();

  // personal info
  String name = '';
  String age = '';
  String gender = '';
  String grade = '';
  String faculty = '';
  String department = '';
  String city = '';
  String country = '';
  String profileHeading = '';

  // Appearance
  String height = '';
  String weight = '';
  String bodyType = '';

  // Life style
  String interest = '';
  String club = '';
  String zodiac = '';
  String bloodType = '';
  String personality = '';
  String drink = '';
  String smoke = '';
  String exercise = '';
  String dietaryRestrictions = '';
  String partTime = '';
  String livingSituation = '';
  String lookingForInaPartner = '';
  String relationshipYouAreLookingFor = '';

  // Background - Cultural Values
  String nationality = '';
  String languageSpoken = '';

  chooseImage() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }

  uploadImages() async
  {
    int i = 1;

    for(var img in _image)
      {
        setState(() {
          val = i / _image.length;
        });

        var refImages = FirebaseStorage.instance
            .ref()
            .child("images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg");

        await refImages.putFile(img)
            .whenComplete(()  async
        {
          await refImages.getDownloadURL()
              .then((urlImage)
          {
            urlsList.add(urlImage);

            i++;
          });
        });
      }
  }

  retrieveUserData() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((snapshot)
    {
      if(snapshot.exists)
        {
          setState(() {
            // personal info
            name = snapshot.data()!["name"];
            nameTextEditingController.text = name;
            age = snapshot.data()!["age"].toString();
            ageTextEditingController.text = age;
            gender = snapshot.data()!["gender"].toString();
            genderTextEditingController.text = gender;
            grade = snapshot.data()!["grade"].toString();
            gradeTextEditingController.text = grade;
            faculty = snapshot.data()!["faculty"];
            facultyTextEditingController.text = faculty;
            department = snapshot.data()!["department"];
            departmentTextEditingController.text = department;
            city = snapshot.data()!["city"];
            cityTextEditingController.text = city;
            country = snapshot.data()!["country"];
            countryTextEditingController.text = country;
            profileHeading = snapshot.data()!["profileHeading"];
            profileHeadingTextEditingController.text = profileHeading;

            // Appearance
            height = snapshot.data()!["height"];
            heightTextEditingController.text = height;
            weight = snapshot.data()!["weight"];
            weightTextEditingController.text = weight;
            bodyType = snapshot.data()!["bodyType"];
            bodyTypeTextEditingController.text = bodyType;

            // Life style
            interest = snapshot.data()!["interest"];
            interestTextEditingController.text = interest;
            club = snapshot.data()!["club"];
            clubTextEditingController.text = club;
            zodiac = snapshot.data()!["zodiac"];
            zodiacTextEditingController.text = zodiac;
            bloodType = snapshot.data()!["bloodType"];
            bloodTypeTextEditingController.text = bloodType;
            personality = snapshot.data()!["personality"];
            personalityTextEditingController.text = personality;
            drink = snapshot.data()!["drink"];
            drinkTextEditingController.text = drink;
            smoke = snapshot.data()!["smoke"];
            smokeTextEditingController.text = smoke;
            exercise = snapshot.data()!["exercise"];
            exerciseTextEditingController.text = exercise;
            dietaryRestrictions = snapshot.data()!["dietaryRestrictions"];
            dietaryRestrictionsTextEditingController.text = dietaryRestrictions;
            partTime = snapshot.data()!["partTime"];
            partTimeTextEditingController.text = partTime;
            livingSituation = snapshot.data()!["livingSituation"];
            livingSituationTextEditingController.text = livingSituation;
            lookingForInaPartner = snapshot.data()!["lookingForInaPartner"];
            lookingForInaPartnerTextEditingController.text = lookingForInaPartner;
            relationshipYouAreLookingFor = snapshot.data()!["relationshipYouAreLookingFor"];
            relationshipYouAreLookingForTextEditingController.text = relationshipYouAreLookingFor;

            //Background - Cultural Values
            nationality = snapshot.data()!["nationality"];
            nationalityTextEditingController.text = nationality;
            languageSpoken = snapshot.data()!["languageSpoken"];
            languageSpokenTextEditingController.text = languageSpoken;
          });
        }
    });
  }

  updateUserDataToFirestoreDatabase(
      // personal info
      String name, String age, String gender,
      String grade, String faculty,
      String department, String city,
      String country, String profileHeading,


      // Appearance
      String height, String weight, String bodyType,

      // Life style
      String interest, String club,
      String zodiac, String bloodType, String personality,
      String drink, String smoke,
      String exercise, String dietaryRestrictions,
      String partTime, String livingSituation,
      String lookingForInaPartner, String relationshipYouAreLookingFor,

      // Background - Cultural Values
      String nationality, String languageSpoken,
      ) async
  {
    showDialog(
        context: context,
        builder: (context)
        {
          return const AlertDialog(
            content: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text("uploading images..."),
                  ],
                ),
              ),
            ),
          );
        }
    );

    await uploadImages();

    await FirebaseFirestore.instance
        .collection("users")
    .doc(currentUserID)
    .update(
      {
        // personal info
        'name': name,
        'age': int.parse(age),
        'gender': gender,
        'grade': int.parse(grade),
        'faculty': faculty,
        'department': department,
        'city': city,
        'country': country,
        'profileHeading': profileHeading,

        // Appearance
        'height': height,
        'weight': weight,
        'bodyType': bodyType,

        // Life style
        'interest': interest,
        'club': club,
        'zodiac': zodiac,
        'bloodType': bloodType,
        'personality': personality,
        'drink': drink,
        'smoke': smoke,
        'exercise': exercise,
        'dietaryRestrictions': dietaryRestrictions,
        'partTime': partTime,
        'livingSituation': livingSituation,
        'lookingForInaPartner': lookingForInaPartner,
        'relationshipYouAreLookingFor': relationshipYouAreLookingFor,

        // Background - Cultural Values
        'nationality': nationality,
        'languageSpoken': languageSpoken,

        // images
        'urlImage1' : urlsList[0].toString(),
        'urlImage2' : urlsList[1].toString(),
        'urlImage3' : urlsList[2].toString(),
        'urlImage4' : urlsList[3].toString(),
        'urlImage5' : urlsList[4].toString(),
      }
    );

    Get.snackbar('updated', "アカウント情報が更新されました。");

    Get.to(HomeScreen());

    setState(() {
      uploading = false;
      _image.clear();
      urlsList.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          next ? "Profile Information" : "Choose 5 images",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          next
              ? Container()
              : IconButton(
                  onPressed: ()
                  {
                    if(_image.length == 5)
                      {
                        setState(() {
                          uploading = true;
                          next = true;
                        });
                      }
                    else
                      {
                        Get.snackbar("5 images", "写真を５枚選んだください");
                      }
                  },
                  icon: const Icon(Icons.navigate_next_outlined, size: 36,),
          ),
        ],
      ),
      body: next
          ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(
                height: 2,
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
                  editingController: dietaryRestrictionsTextEditingController,
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
                    if(
                    // personal info
                    nameTextEditingController.text.trim().isNotEmpty
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
                        && dietaryRestrictionsTextEditingController.text.trim().isNotEmpty
                        && partTimeTextEditingController.text.trim().isNotEmpty
                        && livingSituationTextEditingController.text.trim().isNotEmpty
                        && lookingForInaPartnerTextEditingController.text.trim().isNotEmpty
                        && relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty

                        // Background - Cultural Values
                        && nationalityTextEditingController.text.trim().isNotEmpty
                        && languageSpokenTextEditingController.text.trim().isNotEmpty
                    )
                    {
                      _image.length > 0 ?
                      await updateUserDataToFirestoreDatabase(
                        // personal info

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
                        dietaryRestrictionsTextEditingController.text.trim(),
                        partTimeTextEditingController.text.trim(),
                        livingSituationTextEditingController.text.trim(),
                        lookingForInaPartnerTextEditingController.text.trim(),
                        relationshipYouAreLookingForTextEditingController.text.trim(),

                        // Background - Cultural Values
                        nationalityTextEditingController.text.trim(),
                        languageSpokenTextEditingController.text.trim(),

                      ) : null;
                    }
                    else
                    {
                      Get.snackbar("A Field is empty", "Please fill out all field in text fields");
                    }
                  },

                  child: const Center(
                    child: Text(
                      "Update",
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



            ],
          ),
        ),
      )
          : Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: GridView.builder(
                    itemCount: _image.length + 1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index)
                    {
                      return index == 0
                          ? Container(
                        color: Colors.white30,
                        child: Center(
                          child: IconButton(
                            onPressed: ()
                            {
                              if(_image.length < 5)
                                {
                                  !uploading ? chooseImage() : null;
                                }
                              else
                                {
                                  setState(() {
                                    uploading == true;
                                  });

                                  Get.snackbar("5 Images Chosen", "すでに５枚選択されています");
                                }
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      )
                      : Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image : FileImage(
                                  _image[index - 1]
                              ),
                              fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
      ),
    );
  }
}


