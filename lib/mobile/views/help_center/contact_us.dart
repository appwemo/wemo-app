import 'package:flutter/material.dart';

class ContactUS extends StatelessWidget {
  const ContactUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Contact US !',
            style: TextStyle(color: Colors.deepOrange, fontSize: 35),
          ),
          Text(
            'Help Page is Loading',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
