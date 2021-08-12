import 'city.dart';
void main(){
  print("Hello World");

 // Country item = new Country.Switzerland("Bern","Brown Bear");
 // print("Welcome to " + item.country);
 // item.callHello();
 // print("เมืองหลวงของประเทศ "+item.country+ " คือ : " + item.city);
 // print("สัตว์ประจำชาติ : " + item.callAnimal());
 // print("สีประจำชาติ : "+Country.color);

 var order = City();
 print("Welcome to " + order.country);
 order.callSuper();

 print(order.callAnimal());
 order.callProblem();
}