import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doshisha/global.dart';
import 'package:doshisha/tabScreens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:doshisha/controllers/profile-controller.dart';
import 'package:get/get.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen>
{
  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";

  applyFilter()
  {
    showDialog(
      context: context,
      builder: (BuildContext context)
        {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState)
                {
                  return AlertDialog(
                    title: const Text(
                      "Matching Filter",
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("探しているのは:"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DropdownButton<String>(
                            hint: const Text('性別を選択してください'),
                            value: chosenGender,
                            underline: Container(),
                            items: [
                              '男性',
                              '女性',
                              'その他'
                            ].map((value)
                            {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value)
                            {
                              setState(() {
                                chosenGender = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("国籍:"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DropdownButton<String>(
                            hint: const Text('国名を選択してください'),
                            value: chosenCountry,
                            underline: Container(),
                            items: [
                              '日本',
                              'スペイン',
                              '中国',
                              '韓国',
                              'その他'
                            ].map((value)
                            {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value)
                            {
                              setState(() {
                                chosenCountry = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("学年:"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DropdownButton<String>(
                            hint: const Text('学年を選択してください'),
                            value: chosenGrade,
                            underline: Container(),
                            items: [
                              '1',
                              '2',
                              '3',
                              '4',
                            ].map((value)
                            {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value)
                            {
                              setState(() {
                                chosenGrade = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("学部:"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DropdownButton<String>(
                            hint: const Text('学部を選択してください'),
                            value: chosenFaculty,
                            underline: Container(),
                            items: faculties.map((String faculty) {
                              return DropdownMenuItem<String>(
                                value: faculty,
                                child: Text(
                                  faculty,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue)
                            {
                              setState(() {
                                chosenFaculty = newValue;
                                chosenDepartment = null; // 学部が変更されたら学科の選択をリセット
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("学科:"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DropdownButton<String>(
                            hint: Text("学科を選択してください"),
                            value: chosenDepartment,
                            onChanged: (String? newValue) {
                              setState(() {
                                chosenDepartment = newValue;
                              });
                            },
                            items: chosenFaculty != null
                                ? departmentsInFaculty[chosenFaculty!]?.map((department) {
                              return DropdownMenuItem<String>(
                                value: department,
                                child: Text(department),
                              );
                            }).toList()
                                : null,
                          ),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: ()
                        {
                          Get.back();

                          profileController.getResults();
                        },
                        child: const Text("Done"),
                      ),
                    ],
                  );
                }
          );
        }
    );
  }

  readCurrentUserData() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((dataSnapshot)
    {
       setState(() {
         senderName = dataSnapshot.data()!["name"].toString();
       });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()
      {
        return PageView.builder(
          itemCount: profileController.allUsersProfileList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index)
          {
            final eachProfileInfo = profileController.allUsersProfileList[index];

            return DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      eachProfileInfo.imageProfile.toString(),
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // filter icon button
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: IconButton(
                          onPressed: ()
                          {
                            applyFilter();
                          },
                          icon: const Icon(
                            Icons.filter_list,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    // user data
                    GestureDetector(
                      onTap: ()
                      {
                        profileController.viewSentAndViewReceived(
                          eachProfileInfo.uid.toString(),
                          senderName,
                        );
                        // send user to profile person userDetailScreen
                        Get.to(UserDetailScreen(userID: eachProfileInfo.uid.toString(),
                        ));
                      },
                      child: Column(
                        children: [

                          // name
                          Text(
                            eachProfileInfo.name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          // grade
                          Text(
                            eachProfileInfo.grade.toString() + "年生",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          // faculty & department
                          Text(
                            eachProfileInfo.faculty.toString() + "　" + eachProfileInfo.department.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 4,
                            ),
                          ),

                          const SizedBox(
                            height: 4,
                          ),


                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    // image buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        // favorite button
                        GestureDetector(
                          onTap: ()
                          {
                            profileController.favoriteSentAndFavoriteReceived(
                              eachProfileInfo.uid.toString(),
                              senderName,
                            );
                          },
                          child: Image.asset(
                            "images/favorite.png",
                            width: 60,
                          ),
                        ),

                        // chat button
                        GestureDetector(
                          onTap: ()
                          {

                          },
                          child: Image.asset(
                            "images/chat.png",
                            width: 90,
                          ),
                        ),

                        // like button
                        GestureDetector(
                          onTap: ()
                          {
                            profileController.likeSentAndLikeReceived(
                              eachProfileInfo.uid.toString(),
                              senderName,
                            );
                          },
                          child: Image.asset(
                            "images/like.png",
                            width: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

