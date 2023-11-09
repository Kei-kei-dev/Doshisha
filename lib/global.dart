import 'package:firebase_auth/firebase_auth.dart';

String currentUserID = FirebaseAuth.instance.currentUser!.uid;
String? chosenGrade;
String? chosenFaculty;
String? chosenDepartment;
String? chosenCountry;
String? chosenGender;

List<String> faculties = [
  "神学部",
  "文学部",
  "社会学部",
  "法学部",
  "経済学部",
  "商学部",
  "政策学部",
  "グローバル地域文化学部",
  "文化情報学部",
  "理工学部",
  "生命医科学部",
  "スポーツ健康科学部",
  "心理学部",
  "グローバル・コミュニケーション学部",
];

Map<String, List<String>> departmentsInFaculty = {
  "神学部": [
    "神学科",
  ],
  "文学部": [
    "英文学科",
    "哲学科",
    "美学芸術学科",
    "文化史学科",
    "国文学科",
  ],
  "社会学部": [
    "社会学科",
    "社会福祉学科",
    "メディア学科",
    "産業関係学科",
    "教育文化学科",
  ],
  "法学部": [
    "法律学科",
    "政治学科",
  ],
  "経済学部": [
    "経済学科",
  ],
  "商学部": [
    "商学科",
  ],
  "政策学部": [
    "政策学科",
  ],
  "文化情報学部": [
    "文化情報学科",
  ],
  "理工学部": [
    "インテリジェント情報工学科",
    "情報システムデザイン学科 ",
    "電気工学科",
    "電子工学科",
    "機械システム工学科",
    "機械理工学科",
    "機能分子・生命化学科",
    "化学システム創成工学科",
    "環境システム学科",
    "数理システム学科",
  ],
  "生命医科学部": [
    "医工学科",
    "医情報学科",
    "医生命システム学科",
  ],
  "スポーツ健康科学部": [
    "スポーツ健康科学科",
  ],
  "心理学部": [
    "心理学科",
  ],
  "グローバル・コミュニケーション学部": [
    "グローバル・コミュニケーション学科",
  ],
  "グローバル地域文化学部": [
    "グローバル地域文化学科",
  ],
};


String fcmServerToken = "key=AAAAOwo7Fnk:APA91bG60R45ACgYDsmlJ-8TZqR1uFOHhCPebowYYUxIfQk5JztawYEj3a9B2sqvpy_c7N6RL-71AwPg84vKne_f-v05rm1xXtdnh1ohg-Rcce0A0t4K8PsL5KGv0BKTkbRNNrvBAj_V";