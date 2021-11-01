import 'package:doggo/doggo.dart';
import 'package:doggo/doggodetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
  title: "Doggo App",
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url = Uri.parse("https://raw.githubusercontent.com/martynadyja/flutter_apps-doggo/main/dog-breeds-data.json");
  DoggoHub doggoHub;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    doggoHub = DoggoHub.fromJson(decodedJson);
    print(doggoHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doggo App"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: doggoHub == null ? Center(
        child: CircularProgressIndicator(),
      )
     : GridView.count(
          crossAxisCount: 2,
      children: doggoHub.dogBreeds.map((doge) => Padding(
    padding: const EdgeInsets.all(2.0),
    child: InkWell(
    onTap: (){
      Navigator.push(
          context, MaterialPageRoute(
        builder: (context) => DoggoDetail(
      dogBreeds: doge,
      )));
    },
      child: Hero(
    tag: doge.photo,
    child: Card(
      elevation: 3.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(doge.photo))),
              ),
          Text(
            doge.breed,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    ),
    )
    )
      )).toList(),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
