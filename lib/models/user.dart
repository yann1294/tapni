import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String gender;
  String interestedIn;
  String photo;
  String socialLink;
  Timestamp age;
  GeoPoint location;

  User(
      {this.uid,
      this.name,
      this.gender,
      this.interestedIn,
      this.photo,
      this.socialLink,
      this.age,
      this.location});
}
