

import 'package:peliculas/src/models/pelicula_model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;


class PeliculasProvider{


  Future<List<Pelicula>> _procesarRespuesta(Uri url)async{
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    
    return peliculas.items;
  }
  
  String _apikey     = '22cad0f9eadbc09ce9f641e2318d1d0c';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';  

  Future<List<Pelicula>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apikey,
      'language': _language,
    });

    return await _procesarRespuesta(url);
    
  }

  Future<List<Pelicula>> getPopulares() async{
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apikey,
      'language': _language,
    });
    return await _procesarRespuesta(url);
  }

}