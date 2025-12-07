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
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserForm()),
          );
          if (result == true) fetchUser();
        },
      ),

      body: users.isEmpty
          ? const Center(child: Text('No users found'))
          : Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 per row
                  childAspectRatio: .99, // more height to avoid overflow
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final u = users[index];

                  return Card(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // NAME
                          Text(
                            u.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // EMAIL
                          Text(
                            u.email,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),
                          ),

                          // GENDER
                          Text(
                            u.gender,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),
                          ),

                          const Spacer(),

                          // ACTION BUTTONS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // EDIT
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => UserForm(user: u),
                                    ),
                                  );
                                  if (result == true) fetchUser();
                                },
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),

                              const SizedBox(width: 12),

                              // DELETE
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text('Confirm Delete'),
                                      content: Text('Delete ${u.name}?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
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
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
