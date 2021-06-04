import 'package:clock_app/constant/theme_data.dart';
import 'package:clock_app/data.dart';
import 'package:clock_app/model/alam_info.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alarm',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 24),
            ),
            Expanded(
              child: ListView(
                children: alarms.map<Widget>((alarm) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: alarm.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: alarm.gradientColors.last.withOpacity(0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.label,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Office',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'avenir'),
                                ),
                              ],
                            ),
                            Switch(
                              onChanged: (bool value) {},
                              value: true,
                              activeColor:  Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Mon-Fir',
                              style: TextStyle(
                                  fontFamily: 'avenir',
                                  color: Colors.white,),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '07:00 AM',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.white,
                              fontSize: 24, fontWeight: FontWeight.w700),
                            ),

                            Icon(Icons.keyboard_arrow_down, color: Colors.white,
                            size: 36,)
                          ],
                        ),

                      ],
                    ),
                  );
                }).followedBy([
                  DottedBorder(
                    strokeWidth: 3,
                    color: CustomColors.clockOutline,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(24),
                    dashPattern: [5,4],
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.clockBG,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),

                      child: FlatButton(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        onPressed: () {

                        },
                        child: Column(
                          children: [
                            Image.asset('assets/add_alarm.png', scale: 1.5,),

                            SizedBox(height: 8,),

                            Text(
                              'Add Alarm',
                              style: TextStyle(
                                color: Colors.white, fontFamily: 'avenir'
                              ),

                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]).toList(),
              ),
            ),
          ],
        ));
  }
}
