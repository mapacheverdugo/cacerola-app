import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InformacionScreen extends StatelessWidget {
  dynamic _club = {
    "nombre": "Club de Innovación y Desarrollo",
    "fotoUrl": "https://media.licdn.com/dms/image/C560BAQHkYBXkHQraow/company-logo_400_400/0?e=1579737600&v=beta&t=pEL6QuzqGgRl8wbcdv1cjnKMhk-en_qKYVT8Ng5UA4o",
    "pie": "Creado por miebros del Club de Innovación y Desarrollo (INNDEV) de la Universidad Tecnológica Metropolitana de Santiago",
    "redes": [
        {
          "nombre": "Facebook",
          "color": Color(0xFF3b5998),
          "icono": FontAwesomeIcons.facebookF,
          "url": "https://www.facebook.com/inndevutem/"
        },
        {
          "nombre": "Twitter",
          "color": Color(0xFF1da1f2),
          "icono": FontAwesomeIcons.twitter,
          "url": "https://twitter.com/inndevutem"
        },
        {
          "nombre": "Instagram",
          "color": Color(0xFFe1306c),
          "icono": FontAwesomeIcons.instagram,
          "url": "https://www.instagram.com/inndevutem"
        },
        {
          "nombre": "LinkedIn",
          "color": Color(0xFF0077b5),
          "icono": FontAwesomeIcons.linkedinIn,
          "url": "https://www.linkedin.com/company/inndevutem/"
        }
      ]
  };

  List<dynamic> _creadores = [
    {
      "nombre": "Jorge Verdugo Chacón",
      "cargo": "Desarrollador",
      "fotoUrl": "https://media.licdn.com/dms/image/C4E03AQFJTSQDT8_mkg/profile-displayphoto-shrink_200_200/0?e=1577318400&v=beta&t=8sAkug4QXDrFWk5Gy6vPgFAMRs7UxkQstG5qhGgL4Js",
      "redes": [
        {
          "nombre": "LinkedIn",
          "color": Color(0xFF0077b5),
          "icono": FontAwesomeIcons.linkedinIn,
          "url": "https://www.linkedin.com/in/jorgeverdugoch/"
        },
        {
          "nombre": "GitHub",
          "color": Color(0xFF333333),
          "icono": FontAwesomeIcons.github,
          "url": "https://github.com/mapacheverdugo/"
        }
      ]
    },
    {
      "nombre": "Javiera Vergara Navarro",
      "cargo": "Desarrolladora / Ilustradora",
      "fotoUrl": "https://media.licdn.com/dms/image/C4D03AQEVeunvpZqdJw/profile-displayphoto-shrink_200_200/0?e=1577318400&v=beta&t=bIzX2KrJAsleASOaPiZ2ZgqWXDD3yvC7tvXg7WFneDA",
      "redes": [
        {
          "nombre": "LinkedIn",
          "color": Color(0xFF0077b5),
          "icono": FontAwesomeIcons.linkedinIn,
          "url": "https://www.linkedin.com/in/javieravergara/"
        },
        {
          "nombre": "GitHub",
          "color": Color(0xFF333333),
          "icono": FontAwesomeIcons.github,
          "url": "https://github.com/PollitoMayo/"
        },
        {
          "nombre": "DeviantArt",
          "color": Color(0xFF4dc47d),
          "icono": FontAwesomeIcons.deviantart,
          "url": "https://www.deviantart.com/pollitomayo"
        }
      ]
    }
  ];

  List<Widget> _redesBuilder(List<dynamic> redes) {
    List<Widget> lista = [];
    /*FloatingActionButton(
        backgroundColor: red["color"],
        elevation: 0,
        mini: true,
        child: ,
        onPressed: () async {
          await launch(red["url"]);
        },
      ) */
    for (var red in redes) {
      
      lista.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: red["color"],
        ),
        
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () async {
            await launch(red["url"]);
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle
            ),
            child: Icon(red["icono"],
              color: Colors.white
            ),
          )
        )
      ));
    }
    return lista;
  }

  Widget _creadoresBuilder(List<dynamic> creadores) {
    List<Widget> lista = [];
    lista.add(
      Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Creadores".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 18
          ),
        ),
      )
    );
    for (var creador in creadores) {
      lista.add(Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(creador["fotoUrl"]),
              minRadius: 40,
              maxRadius: 40,
            ),
            Container(height: 20),
            Text(
              creador["nombre"],
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(height: 5),
            Text(
              creador["cargo"],
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54
              ),
            ),
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _redesBuilder(creador["redes"])
            )
          ],
        ),
        
      ));
    }
    return Column(
      children: lista
    );
  }

  Widget _clubBuilder(dynamic club) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            width: 150,
            child: Image.network(club['fotoUrl'])
          ),
          Container(height: 20),
          Text(
            club["nombre"],
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(height: 5),
          Text(
            club["pie"],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54
            ),
          ),
          Container(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _redesBuilder(club["redes"])
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sobre la aplicación",
          style: TextStyle(
            color: Colors.black54
          ),
        )
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: _clubBuilder(_club)
            ),
            Container(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: _creadoresBuilder(_creadores)
            )
          ],
        )
      )
      
    );
  }
}