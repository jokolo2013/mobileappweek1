import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:firebase_database/firebase_database.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String? name, price, status;
  final formKey = GlobalKey<FormState>();

//set data to firebase
  final dbfirebase = FirebaseDatabase.instance.reference().child('Store');

  Future<void> createData() async {
    try {
      await dbfirebase.push().set({
        'product': name,
        'price': price,
        'status': status,
      }).then((value) {
        print("Sucess");
      }).catchError((onError) {
        print(onError.code);
        print(onError.message);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtPrice(),
                txtStatus(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "Product:",
          icon: Icon(Icons.production_quantity_limits),
          hintText: 'Input your product name',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาใส่ข้อมูลด้วย';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          name = value;
        },
      ),
    );
  }

  Widget txtPrice() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "Price",
          icon: Icon(Icons.price_change),
          hintText: 'Input your Product Price ',
        ),
        validator: (value) {},
        onSaved: (value) {
          price = value;
        },
      ),
    );
  }

  Widget txtStatus() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "Detail:",
          icon: Icon(Icons.description),
          hintText: 'Input your Product Detail ',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกรหัสผ่าน';
          } else if (value.length < 6) {
            return 'รหัสผ่านต้องมากกว่า 6 ตัวอักษร';
          }
        },
        onChanged: (value) => status = value,
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print(name);
            print(price);
            print(status);
            createData();
            formKey.currentState!.reset();
          }
        },
        child: Text("Add"),
      );
}
