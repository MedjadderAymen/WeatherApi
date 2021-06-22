import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/Location.dart';

class Forground extends StatelessWidget {
  final locations = [
    Location(
        text: 'New York',
        timing: '19:44 am',
        temp: 15,
        weather: "Cloudy",
        imgUrl:
            "https://images.pexels.com/photos/1755683/pexels-photo-1755683.jpeg"),
    Location(
        text: 'Washington DC',
        timing: '17:44 am',
        temp: 26,
        weather: "Sunny",
        imgUrl:
            "https://images.pexels.com/photos/1796730/pexels-photo-1796730.jpeg"),
    Location(
        text: 'Los Angeles',
        timing: '16:44 am',
        temp: 36,
        weather: "Sunny",
        imgUrl:
        "https://images.pexels.com/photos/1688186/pexels-photo-1688186.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Colors.white),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(
              icon: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://i.ibb.co/Z1fYsws/profile-image.jpg"),
                  backgroundColor: Colors.black26),
              onPressed: null)
        ],
      ),
      body: new Container(
        child: new DefaultTextStyle(
          style: GoogleFonts.raleway(color: Colors.white),
          child: new Column(
            children: [
              Padding(
                padding: new EdgeInsets.symmetric(horizontal: 18),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new SizedBox(
                      height: 35,
                    ),
                    new Text(
                      "Hello siti",
                      style: new TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    new SizedBox(
                      height: 5,
                    ),
                    new Text(
                      "Check the weather by the city",
                      style: new TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    new SizedBox(
                      height: 5,
                    ),
                    new Container(
                      decoration: new BoxDecoration(
                          color: Color(0xfff5f8fd),
                          borderRadius: new BorderRadius.circular(25)),
                      margin: EdgeInsets.symmetric(vertical: 18.0),
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: new Row(
                        children: [
                          new Expanded(
                            child: new TextField(
                              decoration: new InputDecoration(
                                  hintText: "Search city", border: InputBorder.none),
                            ),
                          ),
                          new GestureDetector(
                            onTap: () {},
                            child: new Container(
                              child: new Icon(Icons.search),
                            ),
                          )
                        ],
                      ),
                    ),
                    new SizedBox(
                      height: 20,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "My Locations",
                          style: new TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        OutlinedButton(
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                          onPressed: null,
                          style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              side: new BorderSide(width: 1, color: Colors.white),
                              shape: CircleBorder()),
                        ),
                      ],
                    ),
                    new SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height*0.5,
                      child: new ListView.builder(
                        shrinkWrap: true,
                        itemCount: locations.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CityWeatherTile(
                            text: locations[index].text,
                            timing: locations[index].timing,
                            weather: locations[index].weather,
                            imgUrl: locations[index].imgUrl,
                            temp: locations[index].temp,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityWeatherTile extends StatelessWidget {

  final String text, timing, weather, imgUrl;
  final int temp;

  CityWeatherTile({@required this.text, @required this.timing,@required this.weather,@required this.imgUrl,@required this.temp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(category: title.toLowerCase(),)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: new Stack(
          children: [
            ClipRRect(
              child: Image.network(
                imgUrl,
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width*0.5,
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.circular(8),
            ),
            ClipRRect(
              borderRadius: new BorderRadius.circular(8),
              child: new Container(
                color: Colors.black12,
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width*0.5,
                alignment: Alignment.center,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(text, style: new TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),),
                    new Text(timing, style: new TextStyle(color: Colors.white),),
                    new SizedBox(
                      height: 25,
                    ),
                    new Text("$temp °C", style: new TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),),
                    new SizedBox(
                      height: 25,
                    ),
                    new Text(weather, style: new TextStyle(color: Colors.white),),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}