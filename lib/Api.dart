import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDLQdj0t4L_yFwCgCsyO7NpT6HAVERXRcg";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  search(String search) async {
    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL"
          "&Q=$search"
    );
    if(response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.convertJson(map);
          }
      ).toList();

      for(var video in videos) {
        print("Resultado: " + video.title);
      }

      /*for(var video in dadosJson["items"]) {
        print("Resultado: " + video.toString());
      }*/
      //print("resultado: " + dadosJson["items"].toString());
    }
  }
}