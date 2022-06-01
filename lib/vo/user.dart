



class User {

  int userIdx=0;
  String id='';
  String pw='';
  String regDate='';
  String stage1 = '';
  String stage2 = '';
  String stage3 = '';
  String stage4 = '';


  User({
    this.userIdx=0,
    this.regDate='',
    this.id='',
    this.pw='',
    this.stage1='',
    this.stage2='',
    this.stage3='',
    this.stage4=''
  });


  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userIdx: json['user_idx'],
      id: json['id'],
      pw: json['pw'],
      regDate: json['reg_date'],
      stage1: json['stage1'],
      stage2: json['stage2'],
      stage3: json['stage3'],
      stage4: json['stage4'],
    );

  }
}