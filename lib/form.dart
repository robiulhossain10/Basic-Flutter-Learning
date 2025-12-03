import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> pickImage1() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> pickImage2(ImageSource sourceParam) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: sourceParam);
      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error Picking Image: $e');
    }
  }

  void openImageSourceDialog() {
    showDialog(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ListTile(
              //   leading: const Icon(Icons.image),
              //   title: const Text('Gallery'),
              //   onTap: () {
              //     Navigator.of(dialogCtx, rootNavigator: true).pop();
              //     pickImage2(ImageSource.gallery);
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.camera),
              //   title: const Text('Camera'),
              //   onTap: () {
              //     Navigator.of(dialogCtx, rootNavigator: true).pop();
              //     pickImage2(ImageSource.camera);
              //   },
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(dialogCtx, rootNavigator: true).pop();
                          pickImage2(ImageSource.camera);
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text('CAMERA'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(dialogCtx, rootNavigator: true).pop();
                          pickImage2(ImageSource.gallery);
                        },
                        icon: Icon(Icons.photo, size: 50, color: Colors.red),
                      ),
                      Text('GALLERY'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

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
          Text('Profile Image', style: TextStyle(fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: pickImage1,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              backgroundImage: selectedImage != null
                  ? FileImage(selectedImage!)
                  : null,
              child: selectedImage == null
                  ? Icon(Icons.camera_alt, size: 50, color: Colors.white)
                  : null,
            ),
          ),
          SizedBox(height: 30.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      pickImage2(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_alt, size: 50, color: Colors.blue),
                  ),
                  Text('CAMERA'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      pickImage2(ImageSource.gallery);
                    },
                    icon: Icon(
                      Icons.photo,
                      size: 50,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  Text('GALLERY'),
                ],
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              openImageSourceDialog();
            },
            child: Text('Pick Image'),
          ),

          SizedBox(height: 30.00),
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
            initialValue: _selectedGender,
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
