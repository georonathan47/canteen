// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class sidebar extends StatelessWidget {
  const sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
