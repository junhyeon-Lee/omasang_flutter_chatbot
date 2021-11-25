import 'package:flutter/material.dart';
import 'package:httpconnnection/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Sidebar extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFd0e6f4),
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/oma$rand.png"),
              ),
              accountName: Text('오마상',
                style : TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),),
              accountEmail: Text(''),
              decoration: BoxDecoration(
                color: Color(0xFF538cc4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildMenuItem1(
              text: '학사공지',
              icon: Icons.announcement,
            ),
            const SizedBox(height: 15),
            buildMenuItem2(
              text: '일반공지',
              icon: Icons.message,
            ),
            const SizedBox(height: 15),
            buildMenuItem3(
              text: '장학공지',
              icon: Icons.school,
            ),
            const SizedBox(height: 15),
            buildMenuItem4(
              text: '학사일정',
              icon: Icons.date_range,
            ),
            const SizedBox(height: 15),
            buildMenuItem5(
              text: '버스예매',
              icon: Icons.departure_board
              ,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem0({
    final String text,
    final IconData icon,
  }) {
    final color = Colors.black;
    final hovorColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hovorColor,


    );
  }
  Widget buildMenuItem1({
    final String text,
    final IconData icon,
  }) {
    final color = Colors.black;
    final hovorColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hovorColor,
      onTap: () async {
        const url = 'https://www.hanseo.ac.kr/boardCnts/list.do?boardID=298&m=040101&s=hs';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'could not launh';
        }
      },
    );
  }

  Widget buildMenuItem2({
    final String text,
    final IconData icon,
  }) {
    final color = Colors.black;
    final hovorColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hovorColor,
      onTap: () async {
        const url = 'https://www.hanseo.ac.kr/boardCnts/list.do?boardID=299&m=040102&s=hs';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'could not launh';
        }
      },
    );
  }

  Widget buildMenuItem3({
    final String text,
    final IconData icon,
  }) {
    final color = Colors.black;
    final hovorColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hovorColor,
      onTap: () async {
        const url = 'https://www.hanseo.ac.kr/boardCnts/list.do?boardID=301&m=040104&s=hs';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'could not launh';
        }
      },
    );
  }

  Widget buildMenuItem4({
    final String text,
    final IconData icon,
  }) {
    final color = Colors.black;
    final hovorColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hovorColor,
      onTap: () async {
        const url = 'https://www.hanseo.ac.kr/schdList.do?m=0405&s=hs';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'could not launh';
        }
      },
    );
  }

  Widget buildMenuItem5({
    final String text,
    final IconData icon,
  }) {
    final color = Colors.black;
    final hovorColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hovorColor,
      onTap: () async {
        const url = 'http://hsu.busro.net/rsvm/rsv.html?vwLnDirect=out';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'could not launh';
        }
      },
    );
  }

}