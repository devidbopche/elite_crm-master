import 'package:flutter/material.dart';

import '../Screens/LoginScreen/login_screen.dart';

class show extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: Material(
        //color: Color.fromRGBO(255, 213, 85, 40),
        color: Color.fromARGB(255, 213, 85, 40),


        child: ListView(
          children: <Widget>[

            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  ///  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: "Profile",
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Dealer list',
                    icon: Icons.list_rounded,
                    onClicked: () => selectedItem(context, 1),
                  ),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Notifications',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Add Report',
                    icon: Icons.add,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 5),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  // Widget buildSearchField() {
  //   final color = Colors.white;

  // return TextField(
  //   style: TextStyle(color: color),
  //   decoration: InputDecoration(
  //     contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //     hintText: 'Profile',
  //     hintStyle: TextStyle(color: color),
  //     prefixIcon: Icon(Icons.search, color: color),
  //     filled: true,
  //     fillColor: Colors.white12,
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(5),
  //       borderSide: BorderSide(color: color.withOpacity(0.7)),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(5),
  //       borderSide: BorderSide(color: color.withOpacity(0.7)),
  //     ),
  //   ),
  // );
  // }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>LoginPage(),
        ));

    }
  }
}
