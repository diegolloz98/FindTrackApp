import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SongInf extends StatelessWidget {
  const SongInf({Key? key}) : super(key: key);
  void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    var _iconsize = 40.0;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //show favourite confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Favourite"),
                    content: Text(
                        "Are you sure you want to add this song to your favourites?"),
                    actions: [
                      FlatButton(
                        child: Text("Yes"),
                        onPressed: () {
                          //add song to favourites
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text("No"),
                        onPressed: () {
                          //dismiss dialog
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.favorite_border),
          ),
        ],
        title: Text(
          "Here you go!",
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network("https://www.diapasonvibe.it/wp-content/uploads/2017/09/Nirvana-Nevermind-Michael-Lavine-Spencer-Elden.jpg"),
            SizedBox(height: 20),
            Text("Smells Like Teen Spirit",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Nirvana",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text("Nevermind", style: TextStyle(fontSize: 15)),
            SizedBox(height: 5),
            Text("1991",
                style: TextStyle(fontSize: 15)),
            Divider(
              height: 30,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.black26,
            ),
            Text("Open song in:",
                style: TextStyle(
                  fontSize: 13,
                )),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(
                  iconSize: _iconsize,
                  onPressed: () {
                    _launchURL("https://open.spotify.com/track/5ghIJDpPoe3CfHMGu71E6T?si=2b3149d6c66e4dc4");
                  },
                  icon: Image.asset(
                    'assets/icon/spotify.png',
                    height: 30,
                  ),
                ),
                IconButton(
                  iconSize: _iconsize,
                  onPressed: () {
                    //_launchURL("${widget.song["listenLink"]}");
                  },
                  icon: Icon(Icons.podcasts),
                ),
                IconButton(
                  iconSize: _iconsize,
                  onPressed: () {
                    _launchURL("https://music.apple.com/us/album/smells-like-teen-spirit/1440783617?i=1440783625");
                  },
                  icon: Icon(Icons.apple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}