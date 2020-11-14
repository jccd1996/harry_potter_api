import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:harry_potter_api/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterPage extends StatefulWidget {
  final String appbarTitle;
  final String url;

  const CharacterPage({
    @required this.appbarTitle,
    @required this.url,
  });

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  Future<List<Character>> characters;

  @override
  void initState() {
    super.initState();
    characters = _getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appbarTitle),
      ),
      body: FutureBuilder<List<Character>>(
        future: characters,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data
                  .map((e) => _CharacterItem(character: e))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Character>> _getCharacters() async {
    var response = await http.get(widget.url);
    if (response.statusCode == 200) {
      var characterListResponse = convert.jsonDecode(response.body) as List;
      var characterList =
          characterListResponse.map((e) => Character.fromJson(e)).toList();
      return characterList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class _CharacterItem extends StatelessWidget {
  final Character character;

  const _CharacterItem({
    @required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(character.image),
        ),
        title: Text(character.name),
      ),
    );
  }
}
