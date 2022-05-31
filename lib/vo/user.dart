


class User {

  int userIdx=0;
  String id='';
  String pw='';
  String regDate='';


  User({
    this.userIdx=0,
    this.id='',
    this.regDate='',
    this.pw=''
  });



  factory User.formJson(Map<String, dynamic> json){
    return User(
      userIdx: json['user_idx'],
      id: json['id'],
      pw: json['pw'],
      regDate: json['reg_date']
    );
  }




}