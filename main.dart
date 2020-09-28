import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
  
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Georgian Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "CLEAR"){

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() {

      output = double.parse(_output).toStringAsFixed(2);

    });

  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          actions: [
            IconButton(icon: Icon(Icons.dehaze),
            iconSize: 30.0,
            onPressed: () => {
            Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) =>SecondScreen()
               )
            )
          },
            ),
          ],
        ),

        
        body: new Container(


            child: new Column(
              children: <Widget>[
                
                new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    
                    child: new Text(output, style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,

                    ))),
                new Expanded(
                  child: new Divider(),
                ),


                new Column(children: [
                  new Row(children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ]),

                  new Row(children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X")
                  ]),

                  new Row(children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ]),

                  new Row(children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+")
                  ]),

                  new Row(children: [
                    buildButton("CLEAR"),
                    buildButton("="),
                  ])
                ])
              ],
            ),
            ),
            );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomPadding: false,
      
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('About Developer'),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        elevation: 0.0,


      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage('assets/image.jpg'),

                radius: 40.0,

              ),
            ),
            Divider(
              height: 90.0,
              color: Colors.grey[800],
            ),
            Text('NAME',
            style: TextStyle(
              color: Colors.grey[100],
              letterSpacing: 1.78,
            ),),
            SizedBox(height: 15.0,),
            Text('Georgian Abhishek',
              style: TextStyle(
                color: Colors.amber,
                letterSpacing: 1.78,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(height: 8.0,),
            Text('Age',
              style: TextStyle(
                color: Colors.grey[100],
                letterSpacing: 1.78,
              ),),
            SizedBox(height: 15.0,),
            Text('14 Years old',
              style: TextStyle(
                color: Colors.amber,
                letterSpacing: 1.78,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(height: 35.0,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.mail,
                  color: Colors.grey,
                  size: 40.0,

                ),
                SizedBox(width: 15.0,),
                Text(
                  'abhi1415shek9265\n@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 20.0,
                    letterSpacing: 1.75,
                  ),
                )
              ],
            ),

          ],
        ),
      )
    );
  }
}
