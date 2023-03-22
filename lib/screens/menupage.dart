import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../models/book.dart';

class MenuItems {
  static const books = ItemForMenu("Books", Icons.book);
  static const liked = ItemForMenu("Liked", Icons.thumb_up);
  static const write = ItemForMenu("Contact Us", Icons.edit_note);
  static const rate_us = ItemForMenu("Rate Us", Icons.star_border);
  static const logout = ItemForMenu("Logout", Icons.logout);

  static const all = <ItemForMenu>[books, liked, write, rate_us, logout];
}

class ItemForMenu {
  final String title;
  final IconData icon;

  const ItemForMenu(this.title, this.icon);
}

class MenuPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ItemForMenu currentItem;
  final ValueChanged<ItemForMenu> onSelectedItem;
  MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                      child: Text(
                        'Welcome  ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            Spacer(
              flex: 9,
            ),
          ],
        )),
      );

  Widget buildMenuItem(ItemForMenu item) => ListTile(
        selected: currentItem == item,
        selectedTileColor: Colors.black12,
        minLeadingWidth: 20,
        leading: Icon(
          item.icon,
          color: Colors.white,
        ),
        title: Text(
          item.title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () => onSelectedItem(item),
      );
}
