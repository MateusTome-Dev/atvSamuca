
enum Gender {
  masculino,
  feminino
}

class UserModel {
  String name;
  String email;
  int cellphone;
  String endereco;
  Gender genero;
  UserModel({required this.name,required this.email,required this.cellphone,required this.endereco,required this.genero});
}