import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name, surname, email, password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtSurname(),
                txtMail(),
                txtPassword(),
                txtConPassword(),
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
          labelText: "Name",
          icon: Icon(Icons.account_circle_outlined),
          hintText: 'Input your name',
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

  Widget txtSurname() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "Surname",
          icon: Icon(Icons.account_circle_rounded),
          hintText: 'Input your Surname',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          surname = value!.trim();
        },
      ),
    );
  }

  Widget txtMail() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "Email",
          icon: Icon(Icons.markunread_outlined),
          hintText: 'Input your Email',
        ),
        validator: (value) {
          if (!(value!.contains('@'))) {
            return 'กรุณากรอกข้อมูลตามรูปแบบอีเมลด้วย xxxx@xxx.xxx';
          } else if (!(value.contains('.'))) {
            return 'กรุณากรอกข้อมูลตามรูปแบบอีเมลด้วย .xxx';
          }
        },
        onSaved: (value) {
          email = value;
        },
      ),
    );
  }

  Widget txtPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "Password",
          icon: Icon(Icons.password_outlined),
          hintText: 'Input your Password',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกรหัสผ่าน';
          } else if (value.length < 6) {
            return 'รหัสผ่านต้องมากกว่า 6 ตัวอักษร';
          }
        },
        onChanged: (value) => password = value,
      ),
    );
  }

  Widget txtConPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "Current Password",
          icon: Icon(Icons.password_outlined),
          hintText: 'Input your Password',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกรหัสผ่าน';
          } else if (value != password) {
            return 'รหัสผ่านไม่ตรงกัน';
          }
        },
        onSaved: (value) {
          password = value;
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          print("Hello");
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print(
                "Name : $name Surname : $surname Email : $email Password : $password");
            formKey.currentState!.reset();
          }
        },
        child: Text("Submit"),
      );
}
