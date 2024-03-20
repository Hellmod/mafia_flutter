import 'package:flutter/material.dart';

class MainWidget {
  static Widget toolBar(String title) => Row(
        children: [
         /* Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {},
            ),
          ),*/
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

  static Widget orangeButton({
    required String text,
    required VoidCallback callback,
  }) =>
      Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        child: InkWell(
          onTap: callback,
          // Używamy parametru callback zamiast Utility.workingOn()
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFB445), Color(0xFFD85C30)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text, // Używamy parametru text zamiast stałego ciągu znaków
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  static Widget loadingWidget(String message) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
        ],
      );
}
