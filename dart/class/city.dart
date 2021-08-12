import 'country.dart';
import 'problem.dart';

class City extends Country with Problem {
  City() : super("Bern","Brown Bear");

  void callSuper(){
    print("เมืองหลวง : " + super.city);
    super.callHello();
  }

  @override
  String callAnimal(){
    return "Golden Eagle";
  }
}