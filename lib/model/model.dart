class Servicemodel {
  String? name;
  String? address;
  String? email;
  int? num;
  

  Servicemodel({this.name, this.address, this.email, this.num,

   });

  Servicemodel.fromJson(Map<String, dynamic> jsn) {
    name = jsn['name'];
    address = jsn['address'];
    email = jsn['email'];
    num = jsn['numb'];
   
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'numb': num,
      
    };
  }
}
