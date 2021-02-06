import 'package:adi_client/produto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Produto> _futureProduct;

  Future<Produto> _getAll() async {
    final response =
        await http.get('http://10.0.2.2:44380/api/products/getall');

    if (response.statusCode == 200) {
      return Produto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  void initState() {
    _futureProduct = _getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API products',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch'),
        ),
        body: Center(
          child: FutureBuilder<Produto>(
            future: _futureProduct,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
