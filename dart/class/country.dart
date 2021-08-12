class Country{

  var country = "Switzerland";
  var city;
  var _animal = "Golden Eagle";
  static var color = "Skyblue";

  Country(this.city,this._animal);
  Country.Switzerland(String city,String animal) : this(city, animal);
  callHello() => print("Hi bro");
  //void callH ello(){
    //print("Hi bro");
  //}
  callAnimal() => this._animal;
}
