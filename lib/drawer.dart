import 'package:flutter/material.dart';
import 'package:new_app/service/services.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.white),
          child: UserAccountsDrawerHeader(
            currentAccountPicture: Container(
              alignment: Alignment.topLeft,
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/jambi-co-avatar_PuiQTfq.jpg'),
              ),
            ),
            accountName: const Text("Dragon"),
            accountEmail: const Text("hfghf"),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)),
            otherAccountsPictures: [
              IconButton(
                  onPressed: () => AuthServices().LogOut(),
                  icon: const Icon(Icons.exit_to_app, color: Colors.white))
            ],
          ),
        ),
        ListTile(
          title: const Text("Settings"),
          leading: const Icon(
            Icons.settings,
            color: Colors.blueGrey,
          ),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Shops"),
          leading: const Icon(Icons.shop, color: Colors.greenAccent),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Help"),
          leading: const Icon(Icons.help, color: Colors.lightBlue),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {},
        ),
      ],
    ));
  }
}
