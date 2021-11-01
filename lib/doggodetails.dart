import 'package:doggo/doggo.dart';
import 'package:flutter/material.dart';

class DoggoDetail extends StatelessWidget{
  final DogBreeds dogBreeds;
  DoggoDetail({this.dogBreeds});
  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
      width: MediaQuery.of(context).size.width-20,
      left: 10.0,
      top: MediaQuery.of(context).size.height*0.1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 85.0,
              ),
              Text(
                dogBreeds.breed,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                  "Typ rasy: ${dogBreeds.breedType}"
              ),
              Text(
                  "Pochodzenie: ${dogBreeds.origin}"
              ),
              Text(
                  "Popularność: ${dogBreeds.popularity}"
              ),
              Text(
                  "Hipoalergiczny: ${dogBreeds.hypoallergenic}"
              ),
              Text(
                  "Inteligencja: ${dogBreeds.intelligence}"
              ),
              Text(
                  "Cechy:",
                style: TextStyle(
                   fontWeight: FontWeight.bold
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: dogBreeds.temperament.map((t) => FilterChip(
                  backgroundColor: Colors.yellowAccent,
                  label: Text(
                    t,
                    style: TextStyle(
                      color: Colors.blueAccent
                    ),
                  ),
                  onSelected: (b){},
                )).toList(),
  ),
                ],
              )
          ),
        ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: dogBreeds.photo,
          child: Container(
            height: 200.0,
            width: 250.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  dogBreeds.photo
                )
              )
            ),
          ),
        ),
      )
    ],
  );
  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepOrangeAccent,
      title: Text(
    dogBreeds.breed
    )
      ),
      body: bodyWidget(context
      ),
    );
  }
}