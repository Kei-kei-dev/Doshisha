import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doshisha/global.dart';
import 'package:doshisha/tabScreens/user_details_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PushNotificationSystem
{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // notification arrived
  Future whenNotificationReceived(BuildContext context) async
  {
    // 1. Terminated
    // When the app is completely closed and opened directly from the push notification
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage)
    {
      if(remoteMessage != null)
        {
          // open app and show notification data
          openAppAndShowNotificationData(
            remoteMessage.data["userID"],
            remoteMessage.data["senderID"],
            context,
          );
        }
    });

    // 2. Foreground
    // When the app is open and it receives a push notification
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
      if(remoteMessage != null)
      {
        // open app and show notification data
        openAppAndShowNotificationData(
          remoteMessage.data["userID"],
          remoteMessage.data["senderID"],
          context,
        );
      }
    });

    // 3. Background
    // When the app is in the background and opened directly from the push notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {
      if(remoteMessage != null)
      {
        // open app and show notification data
        openAppAndShowNotificationData(
          remoteMessage.data["userID"],
          remoteMessage.data["senderID"],
          context,
        );
      }
    });
  }


  openAppAndShowNotificationData(receiverID, senderID, context) async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(senderID)
        .get()
        .then((snapshot)
        {
          String profileImage = snapshot.data()!["imageProfile"].toString();
          String name = snapshot.data()!["name"].toString();
          String grade = snapshot.data()!["grade"].toString();
          String faculty = snapshot.data()!["faculty"].toString();
          String department = snapshot.data()!["department"].toString();

          showDialog(
            context: context,
            builder: (context)
              {
                return NotificationDialogBox(
                  senderID,
                  profileImage,
                  name,
                  grade,
                  faculty,
                  department,
                  context,
                );
              }
          );
        }
    );
  }

  NotificationDialogBox(senderID, profileImage, name, grade, faculty, department, context)
  {
    return Dialog(
      child: GridTile(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            height: 300,
            child: Card(
              color: Colors.blue.shade200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(profileImage),
                    fit: BoxFit.cover,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name + "・" + grade.toString() + "年生",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Text(
                          faculty + "・" + department,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                          ),
                        ),

                        const Spacer(),

                        // 2 button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Center(
                              child: ElevatedButton(
                                onPressed: ()
                                {
                                  Get.back();

                                  Get.to(UserDetailScreen(userID: senderID,));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: const Text(
                                  "View Profile"
                                ),
                              ),
                            ),

                            Center(
                              child: ElevatedButton(
                                onPressed: ()
                                {
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                ),
                                child: const Text(
                                    "Close"
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }

  Future generateDeviceRegistrationToken() async
  {
    String? deviceToken = await messaging.getToken();

    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .update(
      {
        "userDeviceToken" : deviceToken,
      }
    );
  }



}
