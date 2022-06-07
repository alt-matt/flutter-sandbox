import 'package:flutter/material.dart';

import '../components/award_icon.dart';
import '../components/cover_iamge.dart';
import '../components/profile_image.dart';
import '../services/api_service.dart';

class MyProfile extends StatelessWidget {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[buildTop(), buildContent()],
    ));
  }

  Widget buildTop() {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center, // Stacks allow overlapping of widgets
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 75),
            child: buildCoverImage()
          ),
          Positioned(
              top: (280 - 144 / 2),
              child:
                  buildProfileImage()) //top = coverImage height - profileImage height
        ]);
  }

  Widget buildContent() => Column(
    children: [
      const SizedBox(height: 8), 
      Text(
        'John Smith', 
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
        ), 
        const SizedBox(),
        Text('Starting XI',
        style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w200)),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          buildAwardIcon(Icons.collections_bookmark, "Top 100", Colors.black),
          buildAwardIcon(Icons.science, "Scientist", Colors.red),
          buildAwardIcon(Icons.newspaper, "Daily Reader", Colors.green),
        ],)
      ],);

  }

