import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doshisha/global.dart';
import 'package:flutter/material.dart';

class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() => _LikeSentLikeReceivedScreenState();
}

class _LikeSentLikeReceivedScreenState extends State<LikeSentLikeReceivedScreen> {

  bool isLikeSentClicked = true;
  List<String> likeSentList = [];
  List<String> likeReceivedList = [];
  List likesList = [];

  getLikeListKeys() async
  {
    if(isLikeSentClicked)
    {
      var favoriteSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString()).collection("likeSent")
          .get();

      for(int i=0; i<favoriteSentDocument.docs.length; i++)
      {
        likeSentList.add(favoriteSentDocument.docs[i].id);
      }

      getKeysDataFromUsersCollection(likeSentList);
    }
    else
    {
      var favoriteReceivedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString()).collection("likeReceived")
          .get();

      for(int i=0; i<favoriteReceivedDocument.docs.length; i++)
      {
        likeReceivedList.add(favoriteReceivedDocument.docs[i].id);
      }

      getKeysDataFromUsersCollection(likeReceivedList);
    }

  }

  getKeysDataFromUsersCollection(List<String> keysList) async
  {
    var allUsersDocument = await FirebaseFirestore.instance.collection("users").get();

    for(int i=0; i<allUsersDocument.docs.length; i++)
    {
      for(int k=0; k<keysList.length; k++)
      {
        if(((allUsersDocument.docs[i].data() as dynamic)["uid"]) == keysList[k])
        {
          likesList.add(allUsersDocument.docs[i].data());
        }
      }
    }

    setState(() {
      likesList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLikeListKeys();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: ()
              {
                likeSentList.clear();
                likeSentList = [];
                likeReceivedList.clear();
                likeReceivedList = [];
                likesList.clear();
                likesList = [];

                setState(() {
                  isLikeSentClicked = true;
                });

                getLikeListKeys();
              },
              child: Text(
                "My Likes",
                style: TextStyle(
                  color: isLikeSentClicked ? Colors.white : Colors.grey,
                  fontWeight: isLikeSentClicked ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),

            const Text(
              "   |   ",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            TextButton(
              onPressed: ()
              {
                likeSentList.clear();
                likeSentList = [];
                likeReceivedList.clear();
                likeReceivedList = [];
                likesList.clear();
                likesList = [];

                setState(() {
                  isLikeSentClicked = false;
                });

                getLikeListKeys();
              },

              child: Text(
                "Liked Me",
                style: TextStyle(
                  color: isLikeSentClicked ? Colors.grey : Colors.white,
                  fontWeight: isLikeSentClicked ? FontWeight.normal : FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: likesList.isEmpty
          ? const Center(
        child: Icon(Icons.person_off_sharp, color: Colors.white, size: 60,),
      )
          : GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8),
        children: List.generate(likesList.length, (index)
        {
          return GridTile(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                color: Colors.blue.shade200,
                child: GestureDetector(
                  onTap: ()
                  {

                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(likesList[index]["imageProfile"],),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),

                            Text(
                              likesList[index]["name"].toString() + "  " + likesList[index]["age"].toString(),
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(
                              height: 4,
                            ),

                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    likesList[index]["city"].toString() + " , " + likesList[index]["country"].toString(),
                                    maxLines: 2,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontSize: 16,
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
          );
        }),

      ),
    );
  }
}

