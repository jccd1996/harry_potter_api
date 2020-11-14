import 'package:flutter/material.dart';
import 'package:harry_potter_api/pages/character_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _goToCharacterPage(context, 'Personajes',
                    'http://hp-api.herokuapp.com/api/characters');
              },
              child: Text('Ver todos los personajes'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToCharacterPage(context, 'Estudiantes',
                    'http://hp-api.herokuapp.com/api/characters/students');
              },
              child: Text('Ver todos los estudiantes'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToCharacterPage(context, 'Staff',
                    'http://hp-api.herokuapp.com/api/characters/staff');
              },
              child: Text('Ver todos los del staff'),
            ),
          ],
        ),
      ),
    );
  }

  void _goToCharacterPage(
      BuildContext context, String appbarTitle, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => CharacterPage(
          appbarTitle: appbarTitle,
          url: url,
        ),
      ),
    );
  }
}
