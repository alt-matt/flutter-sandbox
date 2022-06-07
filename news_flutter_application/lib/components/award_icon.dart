import 'package:flutter/material.dart';

Widget buildAwardIcon(IconData icon, String label, Color colour) => Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 75),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey, spreadRadius: 3)],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,

              radius: 25,
              child: Center(child: Icon(icon, size: 32, color: colour,)),
        ),
          ),
        Positioned(
            child: Text(
              label,
              textAlign: TextAlign.center,
            ))
      ],
    );
