import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherrrr/widgets/weather_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE d MMMM y');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Today',
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              formatDate(DateTime.now()),
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WhetherItem(
              lottie: 'assets/loc.json',
              text: 'Your location is ',
              subText: 'TODO',
            ),
            SizedBox(
              height: 8,
            ),
            WhetherItem(
              lottie: 'assets/temp.json',
              text: 'Your temperature is ',
              subText: 'TODO',
            ),
            SizedBox(
              height: 8,
            ),
            WhetherItem(
              lottie: 'assets/thumbs_up.json',
              text: 'You should ',
              subText: 'TODO',
            ),
          ],
        ),
      ),
    );
  }
}

