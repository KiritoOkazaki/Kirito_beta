import 'package:beta_balmer/pages/viewActivity/Page3.dart';
import 'package:beta_balmer/pages/viewActivity/Page4.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class CalendarSelect extends StatefulWidget {
  @override
  _CalendarSelectState createState() => _CalendarSelectState();
}

class _CalendarSelectState extends State<CalendarSelect> {
  DateTime _currentDate = DateTime.now();
  List<DateTime> _markedDate = [DateTime(2019, 3, 20), DateTime(2019, 3, 21), DateTime(2019,3,22)];//ESTA DEBE SER LA LISTA DE FECHAS DE LA ACTIVIDAD
  int cont = 0;
  var datesGrowable = new List<DateTime>();

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    /// Example with custom icon
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        //_markedDate.insert(cont, date);
        //datesGrowable.add(date);
        //print(date);
        //events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      //markedDates: datesGrowable,
      markedDates: _markedDate,
      markedDateIconBorderColor: Colors.yellow,
      height: 420.0,
      selectedDateTime: _currentDate,
      daysHaveCircularBorder: false,
      
     

      /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      todayTextStyle: TextStyle(
        color: Colors.black,
      ),
      todayBorderColor: Colors.green,
      markedDateMoreShowTotal:
          true, // null for not showing hidden events indicator
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
    );

    return new Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: _calendarCarousel,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 16.0,),
                Container(
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      colors: [const Color(0xFF00827D), Colors.yellow],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: new FlatButton(
                      child: new Text(
                        'Continuar',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                           MaterialPageRoute(
                      builder: (context)=> Page3(),
                        ));
                        //Navigator.pushNamed(context, UIData.activityRoute6);
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
