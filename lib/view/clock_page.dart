import 'package:flutter/material.dart';
import 'package:clock_app/view/clock_view.dart';
import 'file:///D:/Flutter_WorkSpace/clock_app/lib/model/menu_info.dart';
import 'package:intl/intl.dart';
class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(

          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Flexible(
              //   flex: 1,
              //   fit: FlexFit.tight,
              //
              // ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedTime,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 50.0),
                    ),

                    Text(
                      formattedDate,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),


              Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 3,
                      ))),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Timezone',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'UTC' + offsetSign + timezoneString,
                          style: TextStyle(
                              fontFamily: 'avenir',
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );

  }
}
