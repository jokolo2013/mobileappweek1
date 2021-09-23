import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DBLocal {
  var dbname = "TCT";

  Future<Database> connectDB() async {
    //อซิ่งโคนัส
    // หาตำแหน่งของ  Path ในตัว Mobile Device
    dynamic directory =
        await getApplicationDocumentsDirectory(); //ทำบรรทัดนี้ให้เสร็จก่อย
    //  print(directory);
    var location = join(directory.path, this.dbname);
    // print(location);

    //การสร้าง DB File
    var createDB =
        databaseFactoryIo; //class เรียกใช้ method ที่เปิดไฟล์ Database ได้
    var db =
        await createDB.openDatabase(location); //ถ้ามีไฟล์ DB จะเปิดไม่มีจะสร้าง
    // print(db);

    return db;
  }

  Future<void> register(name, surname, email, password) async {
    //print('$name $surname $email $password');
    //กระบวนการสร้าง Database หรือการเปิด Database
    var db = await this.connectDB();
    //การกำหนด Store
    var store = intMapStoreFactory.store('user');
    //print(store);

    var user = await store.add(db, {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
    });
    print(user);
    await store.find(db).then((value) {
      print(value);
    }).catchError((onError) {
      print(onError);
    });

    db.close();
  }

  Future<bool> login(email, password) async {
    var db = await this.connectDB();
    var store = intMapStoreFactory.store('user');

    var user = await store.find(db);

    for (var item in user) {
      if (item['email'] == email && item['password'] == password) {
        return true;
      }
    }
    return false;
  }
}
