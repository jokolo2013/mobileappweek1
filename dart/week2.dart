void main() {
 // print(callGen(1991));
 // var x = callColor("white");
 // print(x);
 callWeb("Google",protocal: "https",port: 443);
}

// (เงื่อนไข    )  ?  true  :  false
String callGen(int year) => (year >= 1996) ? "Gen Z" : "Gen Y";

int callColor([String newColor = "pink"]) {
  //                       0      1
  List<dynamic> color = ["red", "blue", "green"];

  color.add(newColor);

  for (var item in color) {
    print(item);
  }
  return color.length;
}
// fucntion                  name                                  arrow         
void callWeb(String web,{int port = 80, String protocal = "http"}) => print("$protocal $web : $port");


//  if(){
//    print("Gen Z");
//  }else{
//    print("Gen Y");
//  }

 // return x;
