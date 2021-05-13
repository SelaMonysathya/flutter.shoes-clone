import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoes_clone/pages/detail_page.dart';
import 'package:shoes_clone/theme/color.dart';
import 'package:shoes_clone/util/home_page_json.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightGrey,
      body: getBody(size),
    );
  }
  
  Widget getBody(size) {
    return ListView(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 240,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(banner),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrival",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 13,
                  color: grey
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(newArrivals.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 15 : 10,
                  right: index == (newArrivals.length) - 1 ? 15 : 0
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(newArrivals[index]['imageUrl']),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          ),
                          color: white
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newArrivals[index]['name'],
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Text(
                                newArrivals[index]['description'],
                                style: TextStyle(fontSize: 12, color: grey),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "\$${newArrivals[index]['price']}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              RatingBarIndicator(
                                rating: newArrivals[index]['rating'],
                                itemCount: 5,
                                itemSize: 12.0,
                                direction: Axis.horizontal,
                                itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Most Popular",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 13,
                  color: grey
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(mostPopulars.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 15 : 10,
                  right: index == (mostPopulars.length) - 1 ? 15 : 0
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(mostPopulars[index]['imageUrl']),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          ),
                          color: white
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mostPopulars[index]['name'],
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Text(
                                mostPopulars[index]['description'],
                                style: TextStyle(fontSize: 12, color: grey),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "\$${mostPopulars[index]['price']}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              RatingBarIndicator(
                                rating: mostPopulars[index]['rating'],
                                itemCount: 5,
                                itemSize: 12.0,
                                direction: Axis.horizontal,
                                itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}