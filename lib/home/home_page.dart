import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foto_share/auth/bloc/auth_bloc.dart';
import 'package:foto_share/content/agregar/add_form.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:foto_share/content/listaFav/lista.dart';
import 'package:foto_share/content/songInfo/songInf.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 55),
            Center(
              child: Text(
                "Toque para escuchar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 130),
            AvatarGlow(
              glowColor: Colors.purple,
              endRadius: 200.0,
              animate: show,
              child: GestureDetector(
                onTap: () => 
                setState(() {
                  show = !show;
                }),
                onLongPress: () => 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongInf()),
                  )
                  ,
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Image.asset(
                      "assets/icon/music-notes.png",
                      height: 140,
                      width: 140,
                    ),
                    radius: 80,
                  ),
                ),
              ),
            ),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: 
              MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaFav()),
                    );
                  },
                  child: Icon(
                    Icons.favorite,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.white,
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                  },
                  child: Icon(
                    Icons.power_settings_new,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}