import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foto_share/auth/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final urlImage = 'https://i.pinimg.com/originals/f5/2b/90/f52b90a35f512e5108ad2b1a824b049d.gif';
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(urlImage),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
                ),
            ),
            
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Padding(
              padding: const EdgeInsets.all(24.0),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36.0,
                ),
                child: Text('Sign In'),
              ),
            ),
            Image.asset(
              "assets/icon/music-notes.png",
              height : 100,
              ),
              SizedBox(height: 220),
              MaterialButton(
              child: Text("Iniciar con Google"),
              color: Colors.green,
              onPressed: (){
                BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
              },
            ),
            ],
          ),
        );
  }
}