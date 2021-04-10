import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
  title: "Login App",
  home: LoginPage(),
));
class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login App'),
      ),

      body: Padding(
        padding: EdgeInsets.all(10),

        child: ListView(

          children: <Widget>[
            SizedBox
              (
              width: 100,
              height: 150,
              child: Image.asset('assets/logoqb.jpg'),
            ),
            /*
            Container(
              child: Image(image: AssetImage('assets/logocty.png'))
              ,padding:EdgeInsets.all(0) ,
            ),*/

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(
                'LOGIN INFORMATION',
                style: TextStyle(
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10,10, 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password'
                ),
              ),
            ),
            FlatButton(onPressed: (){}
                , textColor: Colors.teal
                , child: Text('Forgot Password')),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10,0, 10, 0),
              child: RaisedButton(
                textColor: Colors.yellow,
                color: Colors.red,
                child: Text('Login'),
                onPressed: (){},
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Does not have account?'),
                  FlatButton(
                    textColor: Colors.yellow,
                    child: Text('Sign in',
                      style: TextStyle(fontSize: 20),),
                    onPressed: (){

                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )


          ],


        ),

      ),
    );
  }
}