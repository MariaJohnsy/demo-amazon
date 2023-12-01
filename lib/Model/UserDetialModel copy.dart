class UserDetialModel{
  final String name;
  final String address;
  UserDetialModel({required this.name, required this.address});

  Map<String,dynamic> getJson() => {
    'name' : name,
    'address' : address,
  };
}