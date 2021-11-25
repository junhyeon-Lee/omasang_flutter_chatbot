import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'SecondRoute.dart';
import 'main.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Comu extends StatelessWidget {
  final String txt;
  final String txt2;
  final String txt3;
  final String txt4;
  final String txt5;
  final String txt6;
  final String txt7;

  const Comu( this.txt,this.txt2,this.txt3,this.txt4,this.txt5,this.txt6,this.txt7, {Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return
      Column(
        children:
        [
          if(txt!="startapp")
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [SizedBox(width: 8,),SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                [

                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 250.0,
                      minWidth: 50.0,
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(txt ,softWrap: true, style : TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),),
                    ),
                    decoration: BoxDecoration(color: Color(0xFFd0e6f4),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.0)
                          ,topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),),
                  ),
                ],
              ),
              SizedBox(width: 16,),
            ],
          ),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(width: 8,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar( radius: 30.0,
                          backgroundColor: Colors.white,
                          child:Image(
                            image: AssetImage('images/oma$rand.png'),
                          )
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text("오마상",
                        style : TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 250.0,
                          minWidth: 50.0,
                        ),
                        child:Padding(

                          padding: const EdgeInsets.all(7.0),
                          child: Linkify(text: txt2,softWrap: true,
                            style : TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600),
                            onOpen: _onOpen,),
                        ),

                        decoration: BoxDecoration(color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30.0)
                              ,bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0)),),
                      ),
                      SizedBox(height: 5,),
                        if(txt7!="NULL")
                        Row(

                          children: [

                            Column(
                              children: [
                              Container(
                                width: 250,
                                child:  InkWell(
                                  child: CachedNetworkImage(
                                    imageUrl: txt7,
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                  ),
                                  onTap: () {
                                    viewData=botMessage6;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SecondRoute(txt7)),
                                    );
                                  },
                                ),
                              ),
                                 ]
                            ),

                          ],
                        ),
                    ],
                  ),
                ],
              ),
          SizedBox(height: 20,),
        ],
      );
  }
  Future<void> _onOpen(LinkableElement link)async{
    if(await canLaunch(link.url)){
      await launch(link.url);
    }else{
      throw('Cannot open link $link');
    }
  }
}





