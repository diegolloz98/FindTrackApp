import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemPublic extends StatefulWidget {
  final Map<String, dynamic> publicFData;
  ItemPublic({Key? key, required this.publicFData}) : super(key: key);

  @override
  State<ItemPublic> createState() => _ItemPublicState();
}

class _ItemPublicState extends State<ItemPublic> {
  void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 13,
                      child: Image.network(
                        "${widget.publicFData["urlImagen"]}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Delete from Favorite"),
                              content: Text(
                                "The song will be deleted from favorites¿Continue?"),
                              actions: [
                                FlatButton(
                                  child: Text("Continue"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        },
                      ),
                    ),
                    Positioned( 
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          primary: Colors.blue[300]
                        ),  
                      onPressed: ()  {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Open Song"),
                              content: Text(
                                "You will be redirected to browser¿Continue?"),
                              actions: [
                                FlatButton(
                                  child: Text("Continue"),
                                  onPressed: () {
                                    _launchURL("${widget.publicFData["song_link"]}");
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ListTile(
                        title: new Center(
                          child: new Text(
                            "${widget.publicFData["title"]}",
                          )
                        ),
                        subtitle: new Center(
                          child: new Text(
                            "${widget.publicFData["artista"]}"
                          ),
                        ),
                      
                      ),
                    ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = ElevatedButton(
    child: Text("Continue"),
    onPressed:  () {},
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  
}

