import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../model/user.dart';

class UserForm extends StatefulWidget {
  final User? user; // for editing
  const UserForm({super.key, this.user});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();
  final TextEditingController dobCtrl = TextEditingController();

  String gender = 'Male';
  bool isActive = true;
  String dob = '';

  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
      final u = widget.user!;
      nameCtrl.text = u.name;
      emailCtrl.text = u.email;
      ageCtrl.text = u.age.toString();
      gender = u.gender;
      dob = u.dob;
      dobCtrl.text = dob;
      isActive = u.isActive;
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    ageCtrl.dispose();
    dobCtrl.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dob.isNotEmpty ? DateTime.parse(dob) : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        dob = picked.toIso8601String().split('T')[0];
        dobCtrl.text = dob;
      });
    }
  }

  void saveUser() async {
    if (!_formKey.currentState!.validate()) return;

    final user = User(
      id: widget.user?.id,
      name: nameCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      age: int.parse(ageCtrl.text),
      gender: gender,
      dob: dob,
      isActive: isActive,
    );

    final db = DatabaseHelper();

    if (widget.user == null) {
      await db.insertUser(user);
    } else {
      await db.updateUser(user);
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user == null ? 'Add User' : 'Edit User',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Name required' : null,
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Email required';
                  if (!v.contains('@')) return 'Invalid email';
                  return null;
                },
              ),
              TextFormField(
                controller: ageCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Age required';
                  if (int.tryParse(v) == null) return 'Enter valid number';
                  return null;
                },
              ),
              TextFormField(
                controller: dobCtrl,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                onTap: pickDate,
                validator: (v) => v == null || v.isEmpty ? 'Select DOB' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: gender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (v) => setState(() => gender = v!),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Active'),
                value: isActive,
                onChanged: (v) => setState(() => isActive = v),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveUser,
                child: Text(widget.user == null ? 'Save User' : 'Update User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
