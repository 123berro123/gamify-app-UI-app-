import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/scrollable.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var _deviceheight;
  var _devicewidth;
  var _selectedpage;
  @override
  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    _selectedpage = 0;

    return Stack(
      children: [
        _featuredgame(),
        _gradientbox(),
        _toplayer(),
      ],
    );
  }

  Widget _featuredgame() {
    return SizedBox(
      height: _deviceheight * 0.50,
      width: _devicewidth,
      child: PageView(
        onPageChanged: (_index) {
          setState(() {
            _selectedpage = _index;
          });
        },
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((_game) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(_game.coverImage.url),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _gradientbox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceheight * 0.8,
        width: _devicewidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromRGBO(35, 45, 59, 1.0),
            Colors.transparent,
          ],
          stops: [0.65, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
      ),
    );
  }

  Widget _toplayer() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _devicewidth * 0.05, vertical: _deviceheight * 0.005),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _topBar(),
            SizedBox(
              height: _deviceheight * 0.20,
            ),
            _feauturedgamesinfo(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: _deviceheight * 0.01),
              child: scrollablegame(
                  height: _deviceheight * 0.24,
                  width: _devicewidth,
                  showtitle: true,
                  gamesData: games),
            ),
            _featuredgatebanner(),
            scrollablegame(height: _deviceheight*0.22, width: _devicewidth, showtitle: false, gamesData: games2)
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return SizedBox(
      height: _deviceheight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: _devicewidth * 0.03,
              ),
              Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _feauturedgamesinfo() {
    return SizedBox(
      height: _deviceheight * 0.12,
      width: _devicewidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 2,
            featuredGames[_selectedpage].title,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: _deviceheight * 0.04,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: _deviceheight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((game) {
              bool _isActive = game.title == featuredGames[_selectedpage].title;
              double _circleradius = _deviceheight * 0.004;
              return Container(
                margin: EdgeInsets.only(right: _devicewidth * 0.015),
                height: _circleradius * 2,
                width: _circleradius * 2,
                decoration: BoxDecoration(
                  color: _isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _featuredgatebanner() {
    return Container(
      height: _deviceheight*0.13,
      width: _devicewidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          
          fit: BoxFit.cover,
          image: NetworkImage(featuredGames[3].coverImage.url))
      ),
    );
  }
}
