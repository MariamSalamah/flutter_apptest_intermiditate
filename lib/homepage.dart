import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:rulers/rulers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//<Map<String,dynamic>>
class _HomePageState extends State<HomePage> {
  @override
  List<Map<String, dynamic>> Cards = [
    {"title": "Standard", "isSelected": true},
    {"title": "Interview", "isSelected": false},
    {"title": "Speech-to-text", "isSelected": false},
  ];
  int _SelectedCard = 0;
  Widget _titleCard({String title, int index, bool Selected}) {
    return InkWell(
      onTap: () {
        setState(() {
          Cards[_SelectedCard]['isSelected'] = false;
          _SelectedCard = index;
          Cards[_SelectedCard]['isSelected'] = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: 200,
          height: 1,
          decoration: BoxDecoration(
              color: Selected ? Colors.redAccent : Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Selected ? Colors.transparent : Colors.white)),
          child: Center(
              child: Text(
            title,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }

 /* Widget _Timeline(){
    return Container(
      color: Colors.black,
      child: Column(
        children: [

        ],
      ),
    );
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Voice Recorder", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("List", style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(width: 20),
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              backgroundColor: Colors.white,
                              child: Container(
                                  height: 200,
                                  width: 100,
                                  child: Column(children: [
                                    InkWell(
                                     onTap: (){},
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(child: Center(child: Text("Audio" , style: TextStyle(fontSize: 30),))),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),

                                    InkWell(
                                      onTap: (){},
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(child: Center(child: Text("Saved Audios" , style: TextStyle(fontSize: 30),))),
                                      ),
                                    ),


                                  ])));
                        });
                  })
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 80),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _titleCard(
                          title: Cards[index]['title'],
                          index: index,
                          Selected: Cards[index]['isSelected']);
                    }),
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: RulerWidget(
              scaleSize: 350,
              scaleColor: Colors.grey[900],
              indicatorWidget: Column(
                children: <Widget>[
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                  ),
                ],
              ),
              limit: 24,
              interval: 15,
              normalBarColor: Colors.grey,
            ),
          ),

          SizedBox(
            height: 400,
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20 , top: 20),
            child: InkWell(
              onTap: (){},
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white , width: 10),
                ),
              ),
            ),
          ),
        ],

      ),
    );
  }
}
