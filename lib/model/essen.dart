import 'dart:ui';

/*class Meeting {
  DateTime? from;
  DateTime? to;
  String? meetingName;
  Color? background;
  bool? isAllDay;
  int? id;
  int? preis;
  bool? vegetarisch;
  bool? vegan;
  bool? mitFleisch;

  Meeting(this.from, this.to, this.meetingName, this.background, this.isAllDay,
      this.id, this.preis, this.vegetarisch, this.vegan, this.mitFleisch);
}*/

class Meeting {
  Meeting(
      {this.eventName,
        this.from,
        this.to,
        this.isAllDay = false,
        required this.background,
        this.essen
        });

  String? eventName;
  DateTime? from;
  DateTime? to;
  Color background;
  bool? isAllDay;
  Essen? essen;
}

class Essen{

  Color? setBackground(){
    if(this.vegetarisch = true){
      background = Color.fromRGBO(255, 255, 0, 80);
    }
    if(this.vegan = true){
      background = Color.fromRGBO(0, 255, 0, 80);
    }
    if(this.mitFleisch = true){
      background = Color.fromRGBO(255, 0, 0, 80);
    }
}


  Essen(
      {this.essenName,
        this.id,
        this.preis,
        this.vegetarisch,
        this.vegan,
        this.mitFleisch
        });

  String? essenName;
  Color? background;
  int? id;
  int? preis;
  bool? vegetarisch;
  bool? vegan;
  bool? mitFleisch;

}