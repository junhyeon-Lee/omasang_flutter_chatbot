import 'dart:convert';
import 'package:flutter/material.dart';
import 'Comu.dart';
import 'main.dart';
import 'sidebar.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Get {
  final String body, body2;
  Get({this.body, this.body2 });

  factory Get.fromJson(Map<String, dynamic> json) {
    return Get(
      body: json['message'],
      body2: json['message2'],
    );
  }
}

 void getWeatherData(String text) async {

  try {
    final response =
    await http.get(Uri.parse('http://ec2-15-164-105-201.ap-northeast-2.compute.amazonaws.com:8000/chatting/$text'));

    if (response.statusCode == 200) {
      String data = response.body;
      Map<String, dynamic> res = jsonDecode(data);
      botMessage=res['message'];
      botMessage2=res['message2'];
      botMessage3=res['message3'];
      botMessage4=res['message4'];
      botMessage5=res['message5'];
      botMessage6=res['message6'];
    } else {
      print("Error!");
    }
  } catch (e) {
    print(e);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Get> post;
  TextEditingController _textEditingController=TextEditingController();
  bool _isComposing = false;
  List<Comu> _chat =[];
  List<Comu> _chat2 =[];
  Icon sendIcon = Icon(Icons.send);

  @override

  Widget build(BuildContext context) {
    if(count==0){
      _handleSubmitted(emp);
      count=1;
    }

    return Scaffold(
      endDrawer: Sidebar(),
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("알려줘요 오마상!!",
              style : TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600),),
        backgroundColor: Colors.blue[70],
        elevation:0.0,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [

          Expanded(
            child:
            ListView.builder(

              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context,index)
              {
                if(count==0){
                  return _chat2[index];
                }
                else
                  return _chat[index];
              },itemCount: _chat.length,),
          ),

          Column(
            children: [
              if(botMessage2!="NULL")
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Container(
                            height: 40,
                            child: TextButton(
                              onPressed: ()=>_handleSubmitted(botMessage2),
                              child: Text(botMessage2),
                            ),
                          ),
                          if(botMessage3!="NULL")
                            Container(
                              height: 40,
                              child: TextButton(
                                onPressed: ()=>_handleSubmitted(botMessage3),
                                child: Text(botMessage3),
                              ),
                            ),
                      if(botMessage4!="NULL")
                      Container(
                        height: 40,
                        child: TextButton(
                          onPressed: ()=>_handleSubmitted(botMessage4),
                          child: Text(botMessage4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Row(mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        SizedBox(width: 10.0,),
                        Expanded(child: TextField(

                          onChanged: (text) {
                            setState(() {
                              _isComposing = text.length > 0;
                            });
                          },

                          controller: _textEditingController,
                          decoration: InputDecoration( hintText: "오마상에게 물어봐주세요"),
                          onSubmitted: _isComposing ? _handleSubmitted : null,

                        ),),
                        SizedBox(width: 5.0,),
                        // ignore: deprecated_member_use
                        // ignore: deprecated_member_use
                        IconButton(onPressed:_isComposing? ()=>_handleSubmitted(_textEditingController.text):null,
                          icon: sendIcon,
                          iconSize: 30,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0,),
        ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text){
    setState(() async{
      _isComposing = false;
      userMessage=text;
      _textEditingController.clear();
      getWeatherData(text);
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        if(text.length>1){
          Comu newchat =Comu(text,botMessage,botMessage2,botMessage3,botMessage4,botMessage5,botMessage6);
          _chat.insert(0,newchat);
        }
        else {
          Comu newchat =Comu(text,'좀 더 자세하게 알려줘...ㅜ','NULL','NULL','NULL','NULL','NULL');
          _chat.insert(0,newchat);
        }
        Comu newchat2 =Comu("","",botMessage2,botMessage3,botMessage4,botMessage5,botMessage6);
        _chat2.insert(0,newchat2);
      }
      );
      }
    );
  }
}