import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_clone/pages/account_page.dart';
import 'package:shoes_clone/pages/home_page.dart';
import 'package:shoes_clone/pages/my_shopping_page.dart';
import 'package:shoes_clone/pages/wishlist_page.dart';
import 'package:shoes_clone/theme/color.dart';
import 'package:shoes_clone/util/constant.dart';
import 'package:shoes_clone/util/drawer_json.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool isNotify = true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightGrey,
      key: _drawerKey,
      appBar: getAppBar(),
      drawer: getDrawer(),
      body: getBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatingActionButton(),
      bottomNavigationBar: getBottomNavigationBar(size),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashRadius: 25,
                onPressed: () {
                  _drawerKey.currentState.openDrawer();
                },
                icon: SvgPicture.asset("assets/images/menu.svg", height: 24),
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/images/search.svg", height: 20,),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(profileUrl),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDrawer() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  splashRadius: 15,
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.only(bottom: 60),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(profileUrl),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(drawerMenus.length, (index) {
                  return SlideInLeft(
                    duration: Duration(milliseconds: drawerMenus[index]['duration']),
                    child: ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          SvgPicture.asset(drawerMenus[index]['imageUrl'], height: 20,),
                          SizedBox(width: 15),
                          Text(drawerMenus[index]['name'])
                        ],
                      ),
                      trailing: drawerMenus[index]['isAction']
                      ? Switch(
                        value: isNotify,
                        onChanged: (value) {
                          setState(() {
                            isNotify = value;
                          });
                        },
                      )
                      : null
                    ),
                  );
                }),
              ),
              Expanded(
                child: SlideInLeft(
                  duration: Duration(milliseconds: 750),
                  child: Container(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.logout, color: blue,),
                          SizedBox(width: 10),
                          Text("Logout", style: TextStyle(color: blue),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: selectedIndex,
      children: [
        HomePage(),
        MyShoppingPage(),
        WishlistPage(),
        AccountPage(),
      ],
    );
  }

  Widget getBottomNavigationBar(size) {
    return Container(
      height: 75,
      width: size.width,
      child: BottomAppBar(
        elevation: 0.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          children: [
            Container(
              width: size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    icon: selectedIndex == 0
                    ? ElasticIn(child: SvgPicture.asset("assets/images/home_active.svg", height: 20))
                    : SvgPicture.asset("assets/images/home_inactive.svg", height: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    icon: selectedIndex == 1
                    ? ElasticIn(child: SvgPicture.asset("assets/images/cart_active.svg", height: 20))
                    : SvgPicture.asset("assets/images/cart_inactive.svg", height: 20),
                  )
                ],
              ),
            ),
            Container(
              width: size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    icon: selectedIndex == 2
                    ? ElasticIn(child: SvgPicture.asset("assets/images/heart_active.svg", height: 20))
                    : SvgPicture.asset("assets/images/heart_inactive.svg", height: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    icon: selectedIndex == 3
                    ? ElasticIn(child: SvgPicture.asset("assets/images/user_active.svg", height: 20))
                    : SvgPicture.asset("assets/images/user_inactive.svg", height: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFloatingActionButton() {
    return ZoomIn(
      duration: Duration(milliseconds: 100),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(color: blue, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add, color: white,),
        ),
      ),
    );
  }
}
