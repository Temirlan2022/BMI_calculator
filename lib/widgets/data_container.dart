import 'package:flutter/material.dart';

const textStyle1 = TextStyle(fontSize: 18.0, color: Colors.white);
const textStyle2 = TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.w900);
const textStyle3 = TextStyle(fontSize: 25.0, color: Colors.white);

class DataContainer extends StatelessWidget {
  DataContainer({@required this.icon, this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(title, style: textStyle1)
      ],
    );
  }
}