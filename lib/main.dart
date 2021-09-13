/*import 'package:essens_plan/model/essen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

void main() {
  runApp(MyApp());
}

List<Appointment> getAppointments(){
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 11, 0 ,0);
  final DateTime endTime = startTime.add(const Duration(hours: 1));

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: essen1.name,
    color: Colors.blue,
    isAllDay: false));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

final essen1 = new essen ("kartoffelbrei",
                          200,
                          false,
                          false,
                          true,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Essensplan'),
        actions: [
          IconButton(onPressed: _loginAdmin, icon: Icon(Icons.face_outlined)),
        ],
      ),
      body: SfCalendar(
        view: CalendarView.workWeek,
        timeSlotViewSettings: TimeSlotViewSettings(
            startHour: 11,
            endHour: 12,
            nonWorkingDays: [
              DateTime.saturday,
              DateTime.sunday,
            ],
            timeInterval: Duration(minutes: 60),
            timeIntervalHeight: 200,
            timeFormat: '',
            dateFormat: 'd',
            dayFormat: 'EEEE',
            timeRulerSize: 0),
            dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
  void _loginAdmin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AnsichtLogin())
    );
  }
}

class AnsichtLogin extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sample App'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Admin Login',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Admin Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        //Navigator.push(
                        //context,
                        //MaterialPageRoute(builder: (context) => AnsichtAdmin()),
                        //);
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Student -->',
                          style: TextStyle(fontSize: 20),),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Essensplan',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //Navigator.push(
                            //  context,
                            //  MaterialPageRoute(builder: (context) => AnsichtStudent()),
                            //);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'model/essen.dart';

void main() => runApp(AdditionalAttribute());

class AdditionalAttribute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdditionalAttribute_Appointment(),
    );
  }
}

class AdditionalAttribute_Appointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppointmentDetails();
}

TextEditingController _eventController = TextEditingController();

class AppointmentDetails extends State<AdditionalAttribute_Appointment> {
  String _subjectText = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: SfCalendar(
              view: CalendarView.week,
              dataSource: getCalendarDataSource(),
              onTap: calendarTapped,
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () =>
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: Text("Add Event"),
                        content: TextFormField(
                          controller: _eventController,
                        ),
                        actions: [
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: Text("Ok"),
                            onPressed: () {
                              if (_eventController.text.isEmpty) {

                              } else {
                                if (
                                MeetingDataSource.appointments.add(Meeting(
                                    (eventName: _eventController.text),
                                    background: Colors.pink,

                                  );
                                }
                              }
                              Navigator.pop(context);
                              _eventController.clear();
                              setState(() {});
                              return;
                            },
                          ),
                        ],
                      ),
                ),
            label: Text("Add Event"),
            icon: Icon(Icons.add),
          ),
        )
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      final Meeting appointmentDetails = details.appointments![0];
      _subjectText = appointmentDetails.eventName!;
      _dateText = DateFormat('MMMM dd, yyyy')
          .format(appointmentDetails.from!)
          .toString();
      _startTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.from!).toString();
      _endTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.to!).toString();
      if (appointmentDetails.isAllDay!) {
        _timeDetails = 'All day';
      } else {
        _timeDetails = '$_startTimeText - $_endTimeText';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(child: new Text('$_subjectText')),
              content: Container(
                height: 136,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$_dateText',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(_timeDetails,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Id:" + appointmentDetails.essen!.id.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Preis:" +
                            appointmentDetails.essen!.preis.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Vegetarisch:" +
                            appointmentDetails.essen!.vegetarisch.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("Vegan:" +
                            appointmentDetails.essen!.vegan.toString())
                      ],
                    ),
                    Row(
                      children: [
                        Text("mit Fleisch:" + EssenDataSource().essensliste
                            .elementAt(0)
                            .mitFleisch
                            .toString())
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text('close'))
              ],
            );
          });
    }
  }


  /*Essen pommes(
      essenName: "Pommes",
      id: 1,
      preis: 250,
      vegan: true,
      vegetarisch: true,
      mitFleisch: false);*/
//as

  MeetingDataSource getCalendarDataSource() {
    List<Meeting> appointments = <Meeting>[];
    appointments.add(Meeting(
        from: DateTime.now(),
        to: DateTime.now().add(const Duration(hours: 1)),
        eventName: 'Meeting',
        isAllDay: true,
        background: Colors.pink,
        essen: EssenDataSource().essensliste.elementAt(0)));

    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 4, days: -1)),
        to: DateTime.now().add(const Duration(hours: 5, days: -1)),
        background: Colors.pink,
        eventName: 'Release Meeting'));

    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 2, days: -2)),
        to: DateTime.now().add(const Duration(hours: 4, days: -2)),
        background: Colors.pink,
        eventName: 'Performance check'));

    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 6, days: -3)),
        to: DateTime.now().add(const Duration(hours: 7, days: -3)),
        background: Colors.pink,
        eventName: 'Support'));

    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 6, days: 2)),
        to: DateTime.now().add(const Duration(hours: 7, days: 2)),
        background: Colors.pink,
        eventName: 'Retrospective'));

    return MeetingDataSource(appointments);
  }
}

final Essen es1 = new Essen(
    essenName: "Pommes",
    id: 1,
    preis: 250,
    vegan: true,
    vegetarisch: true,
    mitFleisch: false);

class EssenDataSource {
  final List<Essen> essensliste = <Essen>[];


  EssenDataSource() {
    essensliste.add(es1);
  }


}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  List<Meeting> _appointments = es1;


  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}