import 'package:flutter/material.dart';

Widget buildCoverImage() => Container(
  color: Colors.grey,
  child: Image.network('https://images.unsplash.com/photo-1531415074968-036ba1b575da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2067&q=80',
    width: double.infinity,
    height: 280,
    fit: BoxFit.cover
  ),
);
