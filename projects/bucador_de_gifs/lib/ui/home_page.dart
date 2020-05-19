import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;

  Future<Map> _getGifs() async {
    http.Response response;
    if(_search == null)
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=OGzwuUNZJddRFAQZcc51DU221JoX2vsG&limit=25&rating=G");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=OGzwuUNZJddRFAQZcc51DU221JoX2vsG&q=$_search&limit=25&offset=0&rating=G&lang=en");

    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

    _getGifs().then(print);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
