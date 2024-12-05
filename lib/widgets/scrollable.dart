import 'package:flutter/material.dart';
import '/data.dart';

class scrollablegame extends StatelessWidget {
  final double height;
  final double width;
  final bool showtitle;
  final List<Game> gamesData;

  const scrollablegame({
    required this.height,
    required this.width,
    required this.showtitle,
    required this.gamesData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gamesData.map((_game) {
          return Container(
            height: height ,
                  width: width * 0.30,
            padding: EdgeInsets.only(right: width*0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.80,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(_game.coverImage.url)),
                  ),
                ),
               showtitle ?  Text(
                  _game.title,
                  maxLines: 2,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: height * 0.08,
                      fontWeight: FontWeight.normal),
                ) : Container()

              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
