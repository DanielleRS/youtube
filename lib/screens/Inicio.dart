import 'package:flutter/material.dart';
import 'package:youtube/model/Video.dart';

import '../Api.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listVideos() {
    Api api = Api();
    return api.search("");
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listVideos(),
      builder: (context, snapshot){
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context, index) {

                    List<Video> videos = snapshot.data;
                    Video video = videos[index];

                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: NetworkImage(video.image)
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.title),
                          subtitle: Text(video.channel),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length
              );
            } else {
              Center(
                child: Text("Nunhum dado a ser exibido!"),
              );
            }
            break;
        }
      },
    );
  }
}
