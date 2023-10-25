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
                          senderName
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

