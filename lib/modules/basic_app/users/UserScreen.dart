import 'package:flutter/material.dart';
import 'package:flutter_app/models/user/userModel.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  List<User> users = [
    User(
      id: 1,
      name: 'Mohamed Nasr',
      phone: '+201016685041',
    ),
    User(
      id: 2,
      name: 'Fares Ahmed',
      phone: '+201092783782',
    ),
    User(
      id: 3,
      name: 'Basel Ahmed',
      phone: '+201014121241',
    ),
    User(
      id: 4,
      name: 'Seif Mahmoud',
      phone: '+201000123485',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUsersInfo(users[index]),
          separatorBuilder: (context, index){
            return Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
            );
          },
          itemCount: users.length,
      ),
    );
  }

  Widget buildUsersInfo(User user){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  child: Text(
                    '${user.id}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${user.phone}',
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
