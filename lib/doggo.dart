class DoggoHub {
  List<DogBreeds> dogBreeds;

  DoggoHub({this.dogBreeds});

  DoggoHub.fromJson(Map<String, dynamic> json) {
    if (json['dogBreeds'] != null) {
      dogBreeds = [];
      json['dogBreeds'].forEach((v) {
        dogBreeds.add(new DogBreeds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dogBreeds'] = this.dogBreeds.map((v) => v.toJson()).toList();
    return data;
  }
}

class DogBreeds {
  String breed;
  String breedType;
  String origin;
  String popularity;
  List<String> temperament;
  String hypoallergenic;
  String intelligence;
  String photo;

  DogBreeds(
      {this.breed,
        this.breedType,
        this.origin,
        this.popularity,
        this.temperament,
        this.hypoallergenic,
        this.intelligence,
        this.photo});

  DogBreeds.fromJson(Map<String, dynamic> json) {
    breed = json['breed'];
    breedType = json['breedType'];
    origin = json['origin'];
    popularity = json['popularity'];
    temperament = json['temperament'].cast<String>();
    hypoallergenic = json['hypoallergenic'];
    intelligence = json['intelligence'].toString();
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['breed'] = this.breed;
    data['breedType'] = this.breedType;
    data['origin'] = this.origin;
    data['popularity'] = this.popularity;
    data['temperament'] = this.temperament;
    data['hypoallergenic'] = this.hypoallergenic;
    data['intelligence'] = this.intelligence;
    data['photo'] = this.photo;
    return data;
  }
}