
class User {

  int userIdx=0;
  String id='';
  String pw='';
  String regDate='';
  String epi1 = '';
  String epi2 = '';
  String epi3 = '';
  String epi4 = '';


  User({
    this.userIdx=0,
    this.regDate='',
    this.id='',
    this.pw='',
    this.epi1='',
    this.epi2='',
    this.epi3='',
    this.epi4=''
  });


  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userIdx: json['user_idx'],
      id: json['id'],
      pw: json['pw'],
      regDate: json['reg_date'],
      epi1: json['epi1'],
      epi2: json['epi2'],
      epi3: json['epi3'],
      epi4: json['epi4'],
    );
  }
}