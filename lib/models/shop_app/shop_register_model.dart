class ShopRegisterModel {
  bool? status;
  String? message;
  UserRegisterData? data;

  ShopRegisterModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserRegisterData.fromJson(json['data']) : null;
  }
}

class UserRegisterData {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserRegisterData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  UserRegisterData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
