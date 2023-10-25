import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';

class UserDetailScreen extends StatefulWidget {

  String? userID;

  UserDetailScreen({super.key, this.userID,});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  // personal info
  String name = '';
  String age = '';
  String grade = '';
  String faculty = '';
  String department = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';

  // Appearance
  String height = '';
  String weight = '';
  String bodyType = '';

  // Life style
  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren = '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';

  // Background - Cultural Values
  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethnicity = '';

  // slider images
  String urlImage1 = 'https://firebasestorage.googleapis.com/v0/b/doshisha-99b52.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=79c44291-a30a-4960-9e66-382c79a56848';
  String urlImage2 = 'https://firebasestorage.googleapis.com/v0/b/doshisha-99b52.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=79c44291-a30a-4960-9e66-382c79a56848';
  String urlImage3 = 'https://firebasestorage.googleapis.com/v0/b/doshisha-99b52.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=79c44291-a30a-4960-9e66-382c79a56848';
  String urlImage4 = 'https://firebasestorage.googleapis.com/v0/b/doshisha-99b52.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=79c44291-a30a-4960-9e66-382c79a56848';
  String urlImage5 = 'https://firebasestorage.googleapis.com/v0/b/doshisha-99b52.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=79c44291-a30a-4960-9e66-382c79a56848';





  retrieveUserInfo() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userID)
        .get()
        .then((snapshot)
    {
      if(snapshot.exists)
        {
          if(snapshot.data()!["urlImage1"] != null)
            {
              setState(() {
                urlImage1 = snapshot.data()!["urlImage1"];
                urlImage2 = snapshot.data()!["urlImage2"];
                urlImage3 = snapshot.data()!["urlImage3"];
                urlImage4 = snapshot.data()!["urlImage4"];
                urlImage5 = snapshot.data()!["urlImage5"];
              });
            }

          setState(() {
            // personal info
            name = snapshot.data()!["name"];
            age = snapshot.data()!["age"].toString();
            grade = snapshot.data()!["grade"].toString();
            faculty = snapshot.data()!["faculty"];
            department = snapshot.data()!["department"];
            phoneNo = snapshot.data()!["phoneNo"];
            city = snapshot.data()!["city"];
            country = snapshot.data()!["country"];
            profileHeading = snapshot.data()!["profileHeading"];
            lookingForInaPartner = snapshot.data()!["lookingForInaPartner"];

            // personal info
            height = snapshot.data()!["height"];
            weight = snapshot.data()!["weight"];
            bodyType = snapshot.data()!["bodyType"];

            // Life style
            drink = snapshot.data()!["drink"];
            smoke = snapshot.data()!["smoke"];
            martialStatus = snapshot.data()!["martialStatus"];
            haveChildren = snapshot.data()!["haveChildren"];
            noOfChildren = snapshot.data()!["noOfChildren"];
            profession = snapshot.data()!["profession"];
            employmentStatus = snapshot.data()!["employmentStatus"];
            income = snapshot.data()!["income"];
            livingSituation = snapshot.data()!["livingSituation"];
            willingToRelocate = snapshot.data()!["willingToRelocate"];
            relationshipYouAreLookingFor = snapshot.data()!["relationshipYouAreLookingFor"];

            //Background - Cultural Values
            nationality = snapshot.data()!["nationality"];
            education = snapshot.data()!["education"];
            languageSpoken = snapshot.data()!["languageSpoken"];
            religion = snapshot.data()!["religion"];
            ethnicity = snapshot.data()!["ethnicity"];


          });

        }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: ()
            {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [

              // image slider
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Carousel(
                    indicatorBarColor: Colors.black.withOpacity(0.3),
                    autoScrollDuration: const Duration(seconds: 2),
                    animationPageDuration: const Duration(milliseconds: 500),
                    activateIndicatorColor: Colors.black,
                    animationPageCurve: Curves.easeIn,
                    indicatorBarHeight: 30,
                    indicatorHeight: 10,
                    indicatorWidth: 10,
                    unActivatedIndicatorColor: Colors.grey,
                    stopAtEnd: false,
                    autoScroll: true,
                    items: [
                      Image.network(urlImage1, fit: BoxFit.cover,),
                      Image.network(urlImage2, fit: BoxFit.cover,),
                      Image.network(urlImage3, fit: BoxFit.cover,),
                      Image.network(urlImage4, fit: BoxFit.cover,),
                      Image.network(urlImage5, fit: BoxFit.cover,),
                    ],

                  ),
                ),
              ),

              // personal info title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Personal Info:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),

              // personal info table data
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    // name
                    TableRow(
                      children: [
                        const Text(
                          "名前: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    // extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    // age
                    TableRow(
                      children: [
                        const Text(
                          "年齢: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // grade
                    TableRow(
                      children: [
                        const Text(
                          "学年: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          grade,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // faculty
                    TableRow(
                      children: [
                        const Text(
                          "学部: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          faculty,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // department
                    TableRow(
                      children: [
                        const Text(
                          "学科: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          department,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // phoneNo
                    TableRow(
                      children: [
                        const Text(
                          "電話番号: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          phoneNo,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // city
                    TableRow(
                      children: [
                        const Text(
                          "出身地: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          city,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // country
                    TableRow(
                      children: [
                        const Text(
                          "国籍: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          country,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // profileHeading
                    TableRow(
                      children: [
                        const Text(
                          "Profile Heading: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          profileHeading,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    //seeking
                    TableRow(
                      children: [
                        const Text(
                          "求めるもの: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          lookingForInaPartner,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                  ],
                ),
              ),

              // appearance title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Appearance:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),

              // appearance table data
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    // height
                    TableRow(
                      children: [
                        const Text(
                          "身長: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          height,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    // extra row
                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // weight
                    TableRow(
                      children: [
                        const Text(
                          "体重: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          weight,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // bodyType
                    TableRow(
                      children: [
                        const Text(
                          "体型: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          grade,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),



                  ],
                ),
              ),

              // life style title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Life Style:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),

              // life style table data
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    // drink
                    TableRow(
                      children: [
                        const Text(
                          "飲酒: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          drink,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    // extra row
                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // smoke
                    TableRow(
                      children: [
                        const Text(
                          "喫煙: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          smoke,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    // extra row
                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // martialStatus
                    TableRow(
                      children: [
                        const Text(
                          "martialStatus: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          martialStatus,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // HaveChildren
                    TableRow(
                      children: [
                        const Text(
                          "haveChildren: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          haveChildren,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // noOfChildren
                    TableRow(
                      children: [
                        const Text(
                          "noOfChildren: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          noOfChildren,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // profession
                    TableRow(
                      children: [
                        const Text(
                          "職業: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          department,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // employmentStatus
                    TableRow(
                      children: [
                        const Text(
                          "employmentStatus: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          employmentStatus,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // income
                    TableRow(
                      children: [
                        const Text(
                          "収入: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          income,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // LivingSituation
                    TableRow(
                      children: [
                        const Text(
                          "一人暮らし？: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          livingSituation,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // WillingToRelocate
                    TableRow(
                      children: [
                        const Text(
                          "willingrelo: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          willingToRelocate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    //relationshipYouAreLookingFor
                    TableRow(
                      children: [
                        const Text(
                          "何目的: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          relationshipYouAreLookingFor,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                  ],
                ),
              ),

              // Background - Cultural Values title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Background - Cultural Values:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),

              // Background - Cultural Values table data
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    // nationality
                    TableRow(
                      children: [
                        const Text(
                          "nationality: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          nationality,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    // extra row
                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // education
                    TableRow(
                      children: [
                        const Text(
                          "education: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          education,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // languageSpoken
                    TableRow(
                      children: [
                        const Text(
                          "話す言語: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          languageSpoken,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // religion
                    TableRow(
                      children: [
                        const Text(
                          "宗教: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          religion,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    // ethnicity
                    TableRow(
                      children: [
                        const Text(
                          "ethnicity: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          ethnicity,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),


                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),



                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
