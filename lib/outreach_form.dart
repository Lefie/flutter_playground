
class OutreachFormData {
  String fullName;
  String age;
  String phoneNumber;
  String email;
  String? community;
  String? experience;
  List<String> tasks;
  bool earlyMorningsPreference;
  bool weeklyReminderPreference;
  String comments;


  OutreachFormData({
    this.fullName = '',
    this.age = '',
    this.phoneNumber = '',
    this.email = '',
    this.community,
    this.experience,
    List<String>? tasks,
    this.earlyMorningsPreference = false,
    this.weeklyReminderPreference = false,
    this.comments = "",
  }) : tasks = tasks ?? [] ;


}