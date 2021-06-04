import 'package:clock_app/constant/theme_data.dart';
import 'package:clock_app/enums.dart';
import 'file:///D:/Flutter_WorkSpace/clock_app/lib/model/menu_info.dart';
import 'package:clock_app/model/alam_info.dart';

List <MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),

];

List <AlarmInfo> alarms =[
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), description: 'Office',gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)), description: 'Sport',gradientColors: GradientColors.sunset),
];
