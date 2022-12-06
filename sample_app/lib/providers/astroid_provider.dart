import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/constant/constants.dart';
import 'package:sample_app/models/Asteroid.dart';
import 'package:sample_app/models/LookUp.dart';

final asteroidsProvider = StateNotifierProvider((ref)=> AsteroidsAPIService(ref.read, ref.watch));


class AsteroidsAPIService extends StateNotifier<Map<String, List<NearEarthObject>>>{
  final read;
  final watch;

  AsteroidsAPIService(this.read,this.watch,[Map<String, List<NearEarthObject>>? state]): super({}){
    getNearEarthObjects();
  }

  void getNearEarthObjects()async {
    final dio = Dio();
    final url = Uri.encodeFull("https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=${API_KEY}");

    final response = await dio.get(url);

    
    final asteroids = Asteroids.fromJson(response.data);

    print(asteroids.elementCount);
    state = asteroids.nearEarthObjects ?? {};
  }

  Future<AsteroidLookUp> getAsteroidDetails(String astId)async{
    final dio = Dio();
    const url = "https://api.nasa.gov/neo/rest/v1/neo/3542519?api_key=$API_KEY";
    
    final response = await dio.get(url);

    final details = AsteroidLookUp.fromJson(response.data);

    return details;
    
  }

}