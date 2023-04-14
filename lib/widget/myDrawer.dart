import 'package:flutter/material.dart';
import 'package:meal/data/Colors.dart';
import '../data/userInfo.dart';
import '../pages/profile.dart';
class myDrawer extends StatelessWidget {
  final user=User(name: 'admin',email: "admin@mail.com",password: "1234");
  myDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shadowColor: black,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: main1Color),
                child: const Center(child: Text("Menu"))),
            ListTile(
              iconColor: main1Color,
              leading: const Icon(Icons.account_box),
              title: const Text('Profile'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(user: user),
                ),
              ),
            ),
            ListTile(
              iconColor: main1Color,
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () => Navigator.pushNamed(context, "/Favorite"),
            ),
            ListTile(
              iconColor: main1Color,
              leading: const Icon(Icons.app_registration),
              title: const Text('Materials'),
              onTap: () => Navigator.pushNamed(context, "/Materials"),
            ),
            ListTile(
              iconColor: main1Color,
              leading: const Icon(Icons.equalizer),
              title: const Text('Total Calories'),
              onTap: () => Navigator.pushNamed(context, "/TotalCalories"),
            ),
            ListTile(
              iconColor: main1Color,
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () => Navigator.pushNamed(context, "/About"),
            ),
          ],
        ));
  }
}