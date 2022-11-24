import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String mapUrl;
  final String chatUrl;
  final String price;
  final int rating;
  final String address;
  final String city;
  final String photos1;
  final String photos2;
  final String photos3;
  final String photos4;
  final String photos5;
  final String imageFacility1;
  final String imageFacility2;
  final String imageFacility3;
  final String nameFacility1;
  final String nameFacility2;
  final String nameFacility3;
  final int numberFacility1;
  final int numberFacility2;
  final int numberFacility3;

  CityModel({
    required this.id,
    this.name = '',
    this.imageUrl = '',
    this.mapUrl = '',
    this.chatUrl = '',
    this.price = '',
    this.rating = 0,
    this.address = '',
    this.city = '',
    this.photos1 = '',
    this.photos2 = '',
    this.photos3 = '',
    this.photos4 = '',
    this.photos5 = '',
    this.imageFacility1 = '',
    this.imageFacility2 = '',
    this.imageFacility3 = '',
    this.nameFacility1 = '',
    this.nameFacility2 = '',
    this.nameFacility3 = '',
    this.numberFacility1 = 0,
    this.numberFacility2 = 0,
    this.numberFacility3 = 0,
  });

  factory CityModel.fromJson(String id, Map<String, dynamic> json) => CityModel(
        id: id,
        name: json['name'],
        imageUrl: json['imageUrl'],
        mapUrl: json['mapUrl'],
        chatUrl: json['chatUrl'],
        price: json['price'],
        rating: json['rating'],
        address: json['address'],
        city: json['city'],
        photos1: json['photos1'],
        photos2: json['photos2'],
        photos3: json['photos3'],
        photos4: json['photos4'],
        photos5: json['photos5'],
        imageFacility1: json['imageFacility1'],
        imageFacility2: json['imageFacility2'],
        imageFacility3: json['imageFacility3'],
        nameFacility1: json['nameFacility1'],
        nameFacility2: json['nameFacility2'],
        nameFacility3: json['nameFacility3'],
        numberFacility1: json['numberFacility1'],
        numberFacility2: json['numberFacility2'],
        numberFacility3: json['numberFacility3'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        mapUrl,
        chatUrl,
        price,
        rating,
        address,
        city,
        photos1,
        photos2,
        photos3,
        photos4,
        photos5,
        imageFacility1,
        imageFacility2,
        imageFacility3,
        nameFacility1,
        nameFacility2,
        nameFacility3,
        numberFacility1,
        numberFacility2,
        numberFacility3
      ];
}
