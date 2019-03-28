import 'package:flutter/material.dart';
import 'package:beta_balmer/model/activities.dart';

class ActivitiesViewModel {
  
  List<Activities> activitiesItems;

  ActivitiesViewModel({this.activitiesItems});

  getActivities() => <Activities>[
          Activities(
            idAct: 1,
            personImage: "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4",
            personName: "VO Arquitectura",
            image: "https://i.pinimg.com/originals/b9/17/aa/b917aaffae32fc178d8590467df960b0.jpg",
            title: "iluminacion arquitectonica y ambiental",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            direccion: "",
            idioma: "Ingles",
            rating: 4.9,
            price: "\$ 3,500 MXN",
            favorite: true,
            types: "Taller",
            totalSesion: 20,
            award: true,
            quantity: 0,
            latitude: 19.7017572,
            longitude: -101.1945599

          ),
          Activities(
            idAct: 2,
            personImage: "https://cdn.pixabay.com/photo/2016/04/01/09/51/actor-1299629_960_720.png",
            personName: "Carlos Flores",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDAIzsdhpslqjOA6mtB9Mon0uMPFw78BOROADlVq2aBjwvaQlXZw",
            title: "Fotografia por Dummies",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            direccion: "",
            idioma: "Español",
            rating: 4.5,
            price: "\$ 1,200 MXN",
            favorite: false,
            types: "Curso",
            totalSesion: 10,
            award: false,
            quantity: 0,
            latitude: 20.6759204,
            longitude: -103.4629881
          ),

           
      ];
}