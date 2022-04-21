import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foto_share/auth/bloc/auth_bloc.dart';
import 'package:foto_share/content/agregar/add_form.dart';
import 'package:foto_share/content/espera/en_espera.dart';
import 'package:foto_share/content/foru/fotosforu.dart';
import 'package:foto_share/content/mis_fotos/mis_fotos.dart';
import 'package:avatar_glow/avatar_glow.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 2;
  final _pagesNameList = [
    "Fotos 4U",
    "En espera",
    "Agregar",
    "Mi contenido",

  ];
  final _pagesList = [
    FotosForU(),
    EnEspera(),
    AddForm(),
    MisFotos(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
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
            SizedBox(height: 180),
            AvatarGlow(
              glowColor: Colors.blue,
              endRadius: 130.0,
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Image.asset(
                    "assets/icon/music-notes.png",
                    height: 70,
                  ),
                  radius: 55,
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
                    MaterialPageRoute(builder: (context) => EnEspera()),
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
                    Icons.logout,
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