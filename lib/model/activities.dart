import 'package:flutter/material.dart';

class Activities {
  int idAct;
  String personImage;
  String personName;
  String image;
  String title;
  String description;
  String direccion;
  String idioma;
  double rating;
  double latitude;
  double longitude;
  bool favorite;
  String price;
  String types;
  int totalSesion;
  bool award;
  int quantity = 0;


Activities(
      {
        this.idAct,
        this.personImage,
        this.personName,
        this.image,
        this.title,
        this.description,
        this.direccion,
        this.idioma,
        this.rating,
        this.favorite,
        this.price,
        this.types,
        this.totalSesion,
        this.award,
        this.quantity,
        this.latitude,
        this.longitude
      });

  
}

  
