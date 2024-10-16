import 'package:flutter/material.dart';

import '../screens/signInscreen.dart';
class signContainers extends StatefulWidget {
  final Color color;
  final String text2;
  final double borderRadius;

  signContainers({
    required this.text2,
    required this.color,
    this.borderRadius = 0,
  });

  @override
  State<signContainers> createState() => _signContainersState();
}

class _signContainersState extends State<signContainers> {
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SignPage(),
            ),
          );
        },
        child:
        Container(
          width: 270,
          height: 55,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(12),

                  /*image: DecorationImage(
                      image: AssetImage('assets/images/toma.jpg'),fit: BoxFit.fill),*/
              boxShadow:[
                BoxShadow(
                    color: Colors.blueGrey,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15,
                    spreadRadius: 1.0
                ),
                const
                BoxShadow(
                    color: Colors.white,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15,
                    spreadRadius: 1.0
                ),
              ]
          ),
          margin: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text2,
                  style:TextStyle(color: Colors.white,
                      fontSize: 30,
                       fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),

                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
  }
}
