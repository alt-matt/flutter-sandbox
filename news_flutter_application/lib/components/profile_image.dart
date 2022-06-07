import 'package:flutter/material.dart';

Widget buildProfileImage() => CircleAvatar(
  radius: 144 / 2,
  backgroundColor: Colors.grey,
  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  )
);