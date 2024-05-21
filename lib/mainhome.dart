import 'package:flutter/material.dart';


class currentState{
  String state = "hello";
  String getCurrentState(){
    return state;
  }
  void setCurrentStateToText(String text){
    state = text;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}


class MyHomePageState extends State<MyHomePage> {
  String mystate = "hello";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(children: [
        Header(text: "hello",),
        Header(text: "myname", ),
        Header(text: "is",),
        Header(text: "hanseong",),
      ],),
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key, required this.text}) : super(key : key);
  final String text;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  bool _ishover = false;

  @override
  Widget build(BuildContext context) {
    MyHomePageState? parent = context.findAncestorStateOfType<MyHomePageState>();

    return Column(
      children: [
        TextButton(
          onPressed: (){
            parent!.setState(() {
              parent.mystate = widget.text;
            });
          },
          onHover: (_onhover){
            if(!_onhover){
              setState(() {
                _ishover = false;
              });
            }
            else {
              setState(() {
                _ishover = true;
              });
            }
          },

          child: Text(widget.text),
        ),
        AnimatedContainer(duration: Duration(seconds: 1), width: (_ishover || (parent!.mystate == widget.text)) ? 50: 0 , height: 1, color: Colors.black,)
      ],
    );
  }
}
