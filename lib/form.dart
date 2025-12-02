import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DemoForm extends StatefulWidget {
  const DemoForm({super.key});

  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController multilineCtrl = TextEditingController();

  String? _selectedGender;
  bool agreeTerms = false;
  bool notifyMe = false;
  DateTime? selectedDate;

  File? selectedImage;

  void _showToast() {
    Fluttertoast.showToast(
      msg:
          '''
Name: ${nameCtrl.text}
Email: ${emailCtrl.text}
Password: ${passCtrl.text}
Number: ${numberCtrl.text}
Message: ${multilineCtrl.text}
''',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo Form"), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: emailCtrl,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: passCtrl,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: numberCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: multilineCtrl,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: "Message",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),

          DropdownButtonFormField<String>(
            value: _selectedGender,
            decoration: InputDecoration(
              labelText: "Gender",
              border: OutlineInputBorder(),
            ),
            items: [
              "Male",
              "Female",
              "Other",
            ].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          // Agree Terms Checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: agreeTerms,
                onChanged: (value) {
                  setState(() {
                    agreeTerms = value ?? false;
                  });
                },
              ),
              Text("Agree to Terms and Conditions"),
            ],
          ),
          // Notify Me Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notify Me"),
              Switch(
                value: notifyMe,
                onChanged: (value) {
                  setState(() {
                    notifyMe = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(onPressed: _showToast, child: Text("Submit")),
        ],
      ),
    );
  }
}
