
import 'package:flutter/material.dart';
import 'package:geo_tagging/static/temp1.dart';
import 'package:geolocator/geolocator.dart';






class LogicPage extends StatefulWidget {
  LogicPage({Key key}) : super(key: key);

  @override
  _LogicPageState createState() => _LogicPageState();
}

class _LogicPageState extends State<LogicPage> {
    Position _currentPosition;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Location/image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null)
              SelectableText(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
         
                    

            FlatButton(

              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),

            FlatButton(

              child: Text("Copy The location by long press and click Me"),
              onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => MyApp1()
                            ));
              },
            ),
            
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}