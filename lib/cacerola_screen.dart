import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';


class CacerolaScreen extends StatefulWidget {
  CacerolaScreen({Key key}) : super(key: key);

  @override
  _CacerolaScreenState createState() => _CacerolaScreenState();
}

class _CacerolaScreenState extends State<CacerolaScreen> {
  AudioCache _audioCache = AudioCache();
  String _imagenPath = 'assets/images/cacerolazo1.png';
  List<int> _tiempos = [1000, 1000, 500, 500, 1000];
  bool _estaCaceroleando = false;

  void _cacerolear() {
    setState(() {
      _imagenPath = 'assets/images/cacerolazo2.png';
    });
    _audioCache.play('cacerolazo.mp3');
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _imagenPath = 'assets/images/cacerolazo1.png';
      });
    });
  }

  void _caceroleoAutomatico(int i) async {
    if (_estaCaceroleando) {
      _cacerolear();
      Future.delayed(Duration(milliseconds: _tiempos[i]), () async {
        
        if (i < _tiempos.length - 1) {
          _caceroleoAutomatico(i + 1);
        }
      });
    }
  }

  void _caceroleoNonStop() async {
    _estaCaceroleando = true;
    int sumaTotal = 0;
    for (var tiempo in _tiempos) {
      sumaTotal += tiempo;
    }

    _caceroleoAutomatico(0);

    Future.delayed(Duration(milliseconds: sumaTotal), () async {
      if (_estaCaceroleando) {
        _caceroleoNonStop();
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "#CACEROLAZO",
          style: TextStyle(
            color: Colors.black54
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.audiotrack,
              color: Colors.grey,
            ),
            onPressed: () {
              if (_estaCaceroleando) {
                _estaCaceroleando = false;
              } else {
                _caceroleoNonStop();
              }
              
            },
            tooltip: "Automático",
          ),
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/informacion');
            },
            tooltip: "Información",
          )
        ],
      ),
      body: GestureDetector(
        onTapDown: (TapDownDetails tap) {
          if (_estaCaceroleando) {
            _estaCaceroleando = false;
          } else {
            _cacerolear();
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Image.asset(_imagenPath),
            )
          )
        ),
      )
    );
  }
}