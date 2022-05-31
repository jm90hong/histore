



class User {

  int userIdx=0;
  String id='';
  String pw='';
  String regDate='';



  User({
    this.userIdx=0,
    this.regDate='',
    this.id='',
    this.pw=''
  });


  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userIdx: json['user_idx'],
      id: json['id'],
      pw: json['pw'],
      regDate: json['reg_date']
    );

  }
}