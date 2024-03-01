import 'package:flutter/material.dart';
import 'halamanUtama.dart';

class calculatorPage extends StatefulWidget {
  const calculatorPage({Key? key}) : super(key: key);

  @override
  State<calculatorPage> createState() => _calculatorPageState();
}

class _calculatorPageState extends State<calculatorPage> {
  dynamic displaytxt = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.logout), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return HalamanUtama();
              }), (route) => false,
            );
          },),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.greenAccent[100],
            child: SizedBox(
              width: 450,
              height: 580,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Display Kalkulator
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.all(10.0),
                          child: Text('$text',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      calculator('AC',Colors.grey,Colors.black),
                      calculator('+/-',Colors.grey,Colors.black),
                      calculator('%',Colors.grey,Colors.black),
                      calculator('/',Colors.amber,Colors.white),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      calculator('7',Colors.grey,Colors.white),
                      calculator('8',Colors.grey,Colors.white),
                      calculator('9',Colors.grey,Colors.white),
                      calculator('x',Colors.amber,Colors.white),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      calculator('4',Colors.grey,Colors.white),
                      calculator('5',Colors.grey,Colors.white),
                      calculator('6',Colors.grey,Colors.white),
                      calculator('-',Colors.amber,Colors.white),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      calculator('1',Colors.grey,Colors.white),
                      calculator('2',Colors.grey,Colors.white),
                      calculator('3',Colors.grey,Colors.white),
                      calculator('+',Colors.amber,Colors.white),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //this is button Zero
                      ElevatedButton(
                        // padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                        onPressed: (){
                          calculation('0');
                        },
                        // shape: StadiumBorder(),
                        child: Text('0',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white),
                        ),
                        // color: Colors.grey[850],
                      ),
                      calculator('.',Colors.grey,Colors.white),
                      calculator('=',Colors.amber,Colors.white),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget calculator(String btntxt,Color btncolor,Color txtcolor){
    return  Container(
      child: ElevatedButton(
        onPressed: (){
          calculation(btntxt);
        },
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        // shape: CircleBorder(),
        // color: btncolor,
        // padding: EdgeInsets.all(20),
      ),
    );
  }

  //Calculator logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
