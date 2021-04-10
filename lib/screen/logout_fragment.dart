import 'package:flutter/material.dart';
import 'package:day2/screen/login.dart';
class LogoutFragmentWidget extends StatefulWidget {
  @override
  _LogoutFragmentWidgetState createState() => _LogoutFragmentWidgetState();
}

class _LogoutFragmentWidgetState extends State<LogoutFragmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Are you logout',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w500,
            fontSize: 40
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.black,
                onSurface: Colors.grey,
                minimumSize: Size(50, 40),
                elevation: 20
              ),
              label: Text('Yes'),
              icon: Icon(Icons.check),
              onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                  LoginScreen()
                  ));
                  }),
                SizedBox(width:10,),
                ElevatedButton.icon(
                style:  ElevatedButton.styleFrom(
                primary: Colors.red,
                onSurface: Colors.grey,
                ),
                label: Text('No'),
                icon: Icon(Icons.cancel_outlined),
                onPressed:(){})
              ],

            )
          ],
        );

  }
}


