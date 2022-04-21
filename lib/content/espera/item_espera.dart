

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
const String _url = 'https://lis.tn/Warriors';

class ItemEspera extends StatefulWidget {
  final Map<String, dynamic> nonPublicFData;
  ItemEspera({Key? key, required this.nonPublicFData}) : super(key: key);

  @override
  State<ItemEspera> createState() => _ItemEsperaState();
}

class _ItemEsperaState extends State<ItemEspera> {
  bool _switchValue = true;
  @override
  void initState() {
    _switchValue = widget.nonPublicFData["like"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Card(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(15),
      elevation: 10,

      // Dentro de esta propiedad usamos ClipRRect
      child: ClipRRect(

        // Los bordes del contenido del card se cortan usando BorderRadius
        borderRadius: BorderRadius.circular(30),

        // EL widget hijo que será recortado segun la propiedad anterior
        child: Column(
          children: <Widget>[

            // Usamos el widget Image para mostrar una imagen
            GestureDetector(
              onLongPress: (){
                _launchURL;
                print('Link!');
              },
              child: Image(
            
                // Como queremos traer una imagen desde un url usamos NetworkImage
                image: NetworkImage(
                  '${widget.nonPublicFData["urlImagen"]}',
                ),
              ),
            ),

            // Usamos Container para el contenedor de la descripción
            IconButton(
              icon: Icon(
                Icons.favorite,
                  color: _switchValue ? Colors.red : Colors.grey
                ),
              onPressed: (){
                setState((){
                  _switchValue = !_switchValue;
                });
              }
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[300])
              ),
              onPressed: _launchURL,
              child: ListTile(
                title: new Center(
                  child: new Text(
                    "Centered Title",
                  )
                ),
                subtitle: new Center(
                  child: new Text(
                    "My title is centered"
                  ),
                ),
              )
            ),
        
          ],
        ),
    )
    );
  }
}
void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}