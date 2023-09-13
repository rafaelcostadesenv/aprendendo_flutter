import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Rafael"),
            accountEmail: Text("rafael.costa.desenv@gamil.com"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/Avatar.jpg")),
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Botão",
                style: TextStyle(color: MyColors.textligth),
              )),
          const Card(
            child: ListTile(
              title: Text('Home'),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('Cachorros'),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('Gatos'),
            ),
          )
        ],
      ),
    );
  }
}
