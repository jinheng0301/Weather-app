import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherrrr/modules/home_controller.dart';
import 'package:weatherrrr/widgets/weather_item.dart';

class HomePage extends StatelessWidget {
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE d MMMM y');
    return formatter.format(date);
  }

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        title: Center(
          child: Column(
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
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WheatherItem(
                icon: 'assets/loc.json',
                text: 'Your location is ',
                subText: _controller.address,
              ),
              SizedBox(
                height: 8,
              ),
              WheatherItem(
                icon: 'assets/temp.json',
                text: 'Your temperature is ',
                subText: '${_controller.temperature}°C',
              ),
              SizedBox(
                height: 8,
              ),
              WheatherItem(
                icon: 'assets/thumbs_up.json',
                text: 'You should ',
                subText: _controller.infoText.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// _controller.weatherData.value == null
//               ? Center(
//                   child: LoadingAnimationWidget.fallingDot(
//                     color: Colors.blue,
//                     size: 40,
//                   ),
//                 )
//               : 