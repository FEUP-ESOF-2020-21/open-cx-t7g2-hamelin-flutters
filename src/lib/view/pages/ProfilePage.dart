import 'package:confnect/view/widgets/User/ProfileForumList.dart';
import 'package:flutter/material.dart';
//https://github.com/rajayogan/flutter-profilescreen/blob/master/lib/main.dart

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 40.0),
                Text(
                  'Tom Cruise',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Subscribe guys',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Name',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 25.0),
                ProfileForumList(),
              ],
            ))
      ],
    );
  }
}

// ignore: camel_case_types
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
