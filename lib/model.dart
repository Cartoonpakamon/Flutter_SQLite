class topicModel {
  final int? id;
  final String foodname;
  final String price;
  final String descriptionfood;

  topicModel({this.id,required this.foodname,required this.price,required this.descriptionfood}); //ไม่ต้องเรียงกันก็ได้ตัวไหนมาก่อนหลังได้หมด

  topicModel.formMap(Map<String, dynamic> item)
  : id = item['id'],
  foodname =item['foodname'],
  price = item['price'],
  descriptionfood = item['descriptionfood'];

  Map<String, Object?> toMap(){
    return {'id' : id, 'foodname' : foodname, 'price' : price, 'descriptionfood' : descriptionfood};
  }
}