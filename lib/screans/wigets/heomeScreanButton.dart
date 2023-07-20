// custom_container.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreanButton extends StatelessWidget {
  final String title;
  final String body;
  final String details;
  final String icon;

  HomeScreanButton(
      {required this.title,
      required this.body,
      required this.details,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Fluttertoast.showToast(
              msg: "Trwają prace nad funkcjonalnością",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0x7f595959),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x192f2b43),
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0x1AFFFFFF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Clash Display Variable',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5999999728,
                    color: Color(0xffa3a3a3),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    width: 16,
                    height: 16,
                    child: SvgPicture.asset(
                      'assets/images/Users.svg',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  Text(
                    details,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Color(0xffa3a3a3),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
