
class UserProfile {

  UserProfile({required this.age, required this.petName});

  String age;
  String petName;

  Map<String, dynamic> toJson() {
    return {
      "age":age,
      "pet_name": petName
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> user){
    return UserProfile(age: user["age"], petName: user["petName"]);

  }


}