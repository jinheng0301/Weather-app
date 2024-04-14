import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WheatherItem extends StatelessWidget {
  late final String text;
  late final String subText;
  late final String icon;

  WheatherItem({
    required this.text,
    required this.icon,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * .6,
      height: height * .27,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset(
                icon,
                // transfer class parameter to the widget parameter at the specific point
                // where the utilization is required.
                height: 90,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: text,
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: subText,
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
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
