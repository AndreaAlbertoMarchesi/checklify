import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineFreeDays extends StatelessWidget {
  TimelineFreeDays(this.prevDeadline, this.currentDeadline);

  final DateTime prevDeadline;
  final DateTime currentDeadline;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();
    final Duration durationFromLastDeadline =
        currentDeadline.difference(prevDeadline);
    final Duration durationFromNow = currentDeadline.difference(DateTime.now());

    print(currentDeadline);
    print(prevDeadline);

    getChild(){
      return  Center(
        child: ListTile(
          title: Text(
            "Days between tasks "+durationFromLastDeadline.inDays.toString(),
            style: TextStyle(
              letterSpacing: 0.6,
              fontWeight: FontWeight.bold,
              color: settings.getFont(),
            ),

          ),
          subtitle: Text(
            "Day from now "+durationFromNow.inDays.toString(),
            style: TextStyle(
              letterSpacing: 0.6,
              fontSize: settings.getFontSizeCoffee(),
              color: settings.getFont(),
            ),
          ),
        ),
      );
    }

    _getMonth(int month){
      switch(month){
        case 01 :
          return "january";
          break;
        case 02 :
          return "february";
          break;
        case 03 :
          return "march";
          break;
        case 04 :
          return "april";
          break;
        case 05 :
          return "may";
          break;
        case 06 :
          return "june";
          break;
        case 07 :
          return "july";
          break;
        case 08 :
          return "august";
          break;
        case 09 :
          return "september";
          break;
        case 10 :
          return "october";
          break;
        case 11 :
          return "november";
          break;
        case 12 :
          return "december";
          break;
      }
    }

    return durationFromLastDeadline.inDays.toDouble()<=2
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment :MainAxisAlignment.start,
            children: [
              getChild(),
              prevDeadline.month < currentDeadline.month || prevDeadline.year < currentDeadline.year
                  ? Text(
                      _getMonth(currentDeadline.month),
                      style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 0.6,
                          color: settings.getFont(),
                          fontStyle: FontStyle.italic
                      ),
                    )
                  : Text(""),
            ],
        )
        : Column(
          children: [
            Container(
                height: 20 * durationFromLastDeadline.inDays.toDouble(),
                child:getChild()
            ),
            Container(
                height: 12,
                child: prevDeadline.month < currentDeadline.month || prevDeadline.year < currentDeadline.year
                        ? Text(
                            _getMonth(currentDeadline.month),
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 0.6,
                              color: settings.getFont(),
                              fontStyle: FontStyle.italic
                            ),
                          )
                        : Text(""),
            ),
          ],
        );
  }
}
