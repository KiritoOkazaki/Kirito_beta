import 'package:beta_balmer/pages/createActivity/page6.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:beta_balmer/model/actividad.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class CalendarSelect extends StatefulWidget {
  final Actividad actividad;

  const CalendarSelect({Key key, this.actividad}) : super(key: key);

  @override
  _CalendarSelectState createState() => _CalendarSelectState();
}

class _CalendarSelectState extends State<CalendarSelect> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime(2019, 1, 1);
  String _currentMonth = '';
  int cont = 0;
  var datesGrowable = new List<DateTime>();
  Actividad _actividad;


  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

   @override
  void initState() {
    _actividad = widget.actividad;
    print("Calendario ${_actividad.horaStar}");
    print("Calendario ${_actividad.horaEnd}");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    /// Example with custom icon
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        //_markedDate.insert(cont, date);
        datesGrowable.add(date);
        print(date);
        //events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      markedDates: datesGrowable,
      height: 420.0,
      selectedDateTime: _currentDate,
      daysHaveCircularBorder: true,

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
                Text("Selecciona los respectivos dias para tu actividad"),
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
                        print('NUMERO DE SESIONES: ${datesGrowable.length}');
                        _actividad.setSesion=datesGrowable.length;
                         Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => Page6Act(actividad: _actividad,)));
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
