import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WhetherItem extends StatelessWidget {
  late final String text;
  late final String subText;
  late final String lottie;

  WhetherItem({
    required this.text,
    required this.lottie,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * .5,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset(
                lottie,
                // transfer class parameter to the widget parameter at the specific point
                // where the utilization is required.
                height: 90,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  text: text,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: subText,
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
