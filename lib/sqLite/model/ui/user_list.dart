import 'package:basic_flutter_learning/sqLite/model/ui/user_form.dart';
import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../model/user.dart';


class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [];

  Future<void> fetchUser() async {
    users = await DatabaseHelper().getUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserForm()),
          );
          if (result == true) fetchUser(); // refresh list after add
        },
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final u = users[index];
          return ListTile(
            title: Text(u.name),
            subtitle: Text('${u.email} * ${u.gender}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit,color: Colors.blue,),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => UserForm(user: u)),
                    );
                    if (result == true) fetchUser(); // refresh list after edit
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete,color: Colors.red),
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Confirm Delete'),
                        content: Text('Delete ${u.name}?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                    if (confirm == true) {
                      await DatabaseHelper().deleteUser(u.id!);
                      fetchUser();
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}