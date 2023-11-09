import 'package:cloud_firestore/cloud_firestore.dart';

class Person
{
  // personal info
  String? uid;
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? gender;
  int? grade;
  String? faculty;
  String? department;
  String? city;
  String? country;
  String? profileHeading;
  int? publishedDateTime;

  // Appearance
  String? height;
  String? weight;
  String? bodyType;

  // Life style
  String? interest;
  String? club;
  String? zodiac;
  String? bloodType;
  String? personality;
  String? drink;
  String? smoke;
  String? exercise;
  String? dietaryRestrictions;
  String? partTime;
  String? livingSituation;
  String? lookingForInaPartner;
  String? relationshipYouAreLookingFor;

  // Background - Cultural Values
  String? nationality;
  String? languageSpoken;

  Person({
    // personal info
    this.uid,
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.gender,
    this.grade,
    this.faculty,
    this.department,
    this.city,
    this.country,
    this.profileHeading,
    this.publishedDateTime,

    // Appearance
    this.height,
    this.weight,
    this.bodyType,

    // Life style
    this.interest,
    this.club,
    this.zodiac,
    this.bloodType,
    this.personality,
    this.drink,
    this.smoke,
    this.exercise,
    this.dietaryRestrictions,
    this.partTime,
    this.livingSituation,
    this.lookingForInaPartner,
    this.relationshipYouAreLookingFor,

    // Background - Cultural Values
    this.nationality,
    this.languageSpoken,



  });

  static Person fromDataSnapshot(DocumentSnapshot snapshot)
  {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      // personal info
      uid: dataSnapshot["uid"],
      imageProfile: dataSnapshot["imageProfile"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
      name: dataSnapshot["name"],
      age: dataSnapshot["age"],
      gender: dataSnapshot["gender"],
      grade: dataSnapshot["grade"],
      faculty: dataSnapshot["faculty"],
      department: dataSnapshot["department"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      profileHeading: dataSnapshot["profileHeading"],
      publishedDateTime: dataSnapshot["publishedDateTime"],

      // Appearance
      height: dataSnapshot["height"],
      weight: dataSnapshot["weight"],
      bodyType: dataSnapshot["bodyType"],

      // Life style
      interest: dataSnapshot["interest"],
      club: dataSnapshot["club"],
      zodiac: dataSnapshot["zodiac"],
      bloodType: dataSnapshot["bloodType"],
      personality: dataSnapshot["personality"],
      drink: dataSnapshot["drink"],
      smoke: dataSnapshot["smoke"],
      exercise: dataSnapshot["exercise"],
      dietaryRestrictions: dataSnapshot["dietaryRestrictions"],
      partTime: dataSnapshot["partTime"],
      livingSituation: dataSnapshot["livingSituation"],
      lookingForInaPartner: dataSnapshot["lookingForInaPartner"],
      relationshipYouAreLookingFor: dataSnapshot["relationshipYouAreLookingFor"],


      // Background - Cultural Values
      nationality: dataSnapshot["nationality"],
      languageSpoken: dataSnapshot["languageSpoken"],
    );
  }

  Map<String, dynamic> toJson()=>
      {
        // personal info
        "uid": uid,
        "imageProfile": imageProfile,
        "email": email,
        "password": password,
        "name": name,
        "age": age,
        "gender": gender,
        "grade": grade,
        "faculty": faculty,
        "department": department,
        "city": city,
        "country": country,
        "profileHeading": profileHeading,
        "publishedDateTime": publishedDateTime,

        // Appearance
        "height": height,
        "weight": weight,
        "bodyType": bodyType,

        // Life style
        "interest": interest,
        "club": club,
        "zodiac": zodiac,
        "bloodType": bloodType,
        "personality": personality,
        "drink": drink,
        "smoke": smoke,
        "exercise": exercise,
        "dietaryRestrictions": dietaryRestrictions,
        "partTime": partTime,
        "livingSituation": livingSituation,
        "lookingForInaPartner": lookingForInaPartner,
        "relationshipYouAreLookingFor": relationshipYouAreLookingFor,

        // Background - Cultural Values
        "nationality": nationality,
        "languageSpoken": languageSpoken,

      };



}
