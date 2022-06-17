import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'xyz@gmail.com',
                    style: GoogleFonts.montserrat(),
                  ),
                ],
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.circle)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.circle)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 3'),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.circle)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 4'),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.circle)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 5'),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.circle)),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
