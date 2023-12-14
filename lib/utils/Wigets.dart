import 'package:flutter/material.dart';

class MainWidget {

   static Widget toolBar(String title) =>
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {

              },
            ),
          ),
          SizedBox(width: 16), // Spacja między przyciskiem a tekstem
          Flexible(
            // Flexible pozwala tekstu rozszerzyć się w dostępnej przestrzeni
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.6,
                color: Color(0xffa3a3a3),
              ),
            ),
          ),
          SizedBox(width: 16), // Spacja po prawej stronie tekstu
        ],
      );
}