import 'package:clock_app/enums.dart';
import 'file:///D:/Flutter_WorkSpace/clock_app/lib/model/menu_info.dart';
import 'package:clock_app/view/alarm_page.dart';
import 'package:clock_app/view/clock_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clock_app/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xff2d2f41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((currentMenuInfo) => builderMenuButton(currentMenuInfo)).toList()
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget child){
                  if (value.menuType == MenuType.clock)
                    return ClockPage();
                  else if(value.menuType == MenuType.alarm){
                    return AlarmPage();
                  }
                  else{
                    return Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 20
                          ),
                          children: [
                            TextSpan(text: 'hello'),
                            TextSpan(text: value.title,
                            style: TextStyle(
                              fontSize: 48
                            ),
                            ),
                          ]
                        ),
                      ),
                    );
                  }

                },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: deprecated_member_use
Widget builderMenuButton(MenuInfo currentMenuInfo) {
  return Consumer<MenuInfo>(
    builder: (BuildContext context, MenuInfo value,Widget child){
      return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32),bottomLeft: Radius.circular(32))
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 0.0),
        color: currentMenuInfo.menuType == value.menuType
            ? Colors.black54
            : Colors.transparent,
        onPressed: () {
          var menuInfo = Provider.of<MenuInfo>(context, listen: false);
          menuInfo.updateMenu(currentMenuInfo);

        },
        child: Column(
          children: [
            Image.asset(
              currentMenuInfo.imageSource,
              scale: 1.9,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              currentMenuInfo.title ?? '',
              style: TextStyle(
                  fontFamily: 'avenir',
                  color: Colors.white, fontSize: 14),
            )
          ],
        ),
      );
    },

  );
}
