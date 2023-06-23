import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranking_app/widgets/homepage_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 15,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(38, 35, 46, 100),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('CONNEXION'),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Container(
                        height: 60,
                        width: double.infinity,
                        margin:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                        // padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(69, 64, 82, 60),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Center(
                          child: TextField(
                            // controller: playerNameController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'NOM DU JOUEUR',
                              hintStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: (){
                  //TODO : LOGIN METHOD
                },
                child: const HomepageButton(buttonLabel: 'SE CONNECTER'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
