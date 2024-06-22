// ignore_for_file: unused_local_variable

import 'package:EcomStack/ui/common/app_colors.dart';
import 'package:EcomStack/ui/models/auth_controller.dart';
import 'package:EcomStack/ui/models/categories.dart';
import 'package:EcomStack/ui/views/home/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nopsuite_carousel_slider/effects/worm_effect.dart';
import 'package:nopsuite_carousel_slider/nopsuite_carousel_slider.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Widget mWidget = const HomeView();
    String _title = "Home";
    AuthController authController = AuthController();
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewmodel, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 80,
                  width: 110,
                  child: Center(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/girl.png"),
                  ),
                ),
              ],
            ),
            body: body(),
            drawer: Drawer(
                backgroundColor: Theme.of(context).colorScheme.background,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      DrawerHeader(
                          child: Container(
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      )),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: ListTile(
                          title: Text(
                            "H O M E",
                            style: TextStyle(
                              color: PrimaryColor,
                            ),
                          ),
                          leading: Icon(
                            Icons.home,
                            color: PrimaryColor,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: ListTile(
                          title: Text(
                            "S E T T I N G S",
                            style: TextStyle(
                              color: PrimaryColor,
                            ),
                          ),
                          leading: Icon(
                            Icons.settings,
                            color: PrimaryColor,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, bottom: 25),
                      child: ListTile(
                        title: Text(
                          "L O G O U T",
                          style: TextStyle(
                            color: PrimaryColor,
                          ),
                        ),
                        leading: Icon(
                          Icons.logout,
                          color: PrimaryColor,
                        ),
                        onTap: () {
                          viewmodel.SignOutUser();
                        },
                      ),
                    )
                  ],
                ))));
  }
}

class body extends StatelessWidget {
  const body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            searchbar(),
            SizedBox(
              height: 10,
            ),
            sortfilter(),
            SizedBox(
              height: 10,
            ),
            Categories(),
            SizedBox(
              height: 10,
            ),
            Cards(),
            SizedBox(
              height: 10,
            ),
            dealOfTheDay(),
            SizedBox(
              height: 15,
            ),
            prodlist()
          ],
        ),
      ),
    );
  }
}

class prodlist extends StatelessWidget {
  const prodlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            productCard(
              image: "assets/images/kurta.png",
              title: "Women Printed Kurta",
              pricebf: "Rs 2499",
              priceaf: "Rs 1500",
              off: "40% Off",
              ratings: "56890",
            ),
            SizedBox(width: 10),
            productCard(
                image: "assets/images/shoes.png",
                title: "HRX by Hrithik Roshan",
                pricebf: "Rs 4999",
                priceaf: "Rs 2499",
                off: "50% Off",
                ratings: "344567"),
            SizedBox(width: 10),
            productCard(
              image: "assets/images/kurta.png",
              title: "Women Printed Kurta",
              pricebf: "Rs 2499",
              priceaf: "Rs 1500",
              off: "40% Off",
              ratings: "56890",
            )
          ],
        ));
  }
}

class productCard extends StatelessWidget {
  productCard({
    required this.image,
    required this.title,
    required this.pricebf,
    required this.priceaf,
    required this.off,
    required this.ratings,
    super.key,
  });
  String image;
  String title;
  String pricebf;
  String priceaf;
  String off;
  String ratings;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 285,
          width: 165,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Image(
                height: 120,
                width: 165,
                image: AssetImage(image),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            "Neque porro quisquam est qui dolorem ipsum quia",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Column(children: [
                          Text(
                            priceaf,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ])),
                    Row(
                      children: [
                        Text(
                          pricebf,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          off,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset("assets/images/star1.png"),
                        SizedBox(width: 2),
                        Image.asset("assets/images/star1.png"),
                        SizedBox(width: 2),
                        Image.asset("assets/images/star1.png"),
                        SizedBox(width: 2),
                        Image.asset("assets/images/star1.png"),
                        SizedBox(width: 2),
                        Image.asset("assets/images/star2.png"),
                        SizedBox(width: 10),
                        Text(
                          ratings,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class dealOfTheDay extends StatelessWidget {
  const dealOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/blueback.png"),
      )),
      child: Row(children: [
        Column(
          children: [
            Text(
              "Deal of the Day",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.timer_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "22h 55m 20s remaining ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(10),
            side: BorderSide(color: Colors.white, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("View all"),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        )
      ]),
    );
  }
}

class searchbar extends StatelessWidget {
  const searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(10.0),
      child: TextField(
        onChanged: (text) {
          // Add your logic for handling text changes here
        },
        style: TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            Icons.mic_outlined,
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Search your item',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class sortfilter extends StatelessWidget {
  const sortfilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Text(
            "All Featured",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                surfaceTintColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
            onPressed: () {},
            child: Row(
              children: [
                Text("Sort"),
                SizedBox(
                  width: 8,
                ),
                Image.asset("assets/images/sort.png")
              ],
            ),
          ),
          SizedBox(width: 5),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                surfaceTintColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
            onPressed: () {},
            child: Row(
              children: [
                Text("Filter"),
                SizedBox(
                  width: 8,
                ),
                Image.asset("assets/images/filter.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({
    super.key,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final controller = PageController(viewportFraction: 0.9, keepPage: true);
  final pages = List.generate(
      3,
      (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: images[index],
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "50-40% OFF",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Now in (product)",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "All Products",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(10),
                        side: BorderSide(color: Colors.white, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Shop Now"),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          ));

  @override
  @override
  Widget build(BuildContext context) {
    return NopSuiteCarouselSlider(
      controller: controller,
      count: pages.length,
      itemBuilder: pages,
      height: 200,
      effect: const WormEffect(
          dotHeight: 10,
          dotWidth: 10,
          radius: 30,
          dotColor: Colors.grey,
          activeDotColor: PrimaryColor,
          type: WormType.normal,
          strokeWidth: 5,
          spacing: 2),
    );
  }
}

final images = [
  AssetImage('assets/images/discountCard.png'),
  AssetImage('assets/images/discountCard.png'),
  AssetImage('assets/images/discountCard.png'),
];

class NaviItems {
  String title;
  Widget widget;
  Icon icon;
  Color color;

  NaviItems(this.title, this.widget, this.icon, this.color);
}

class Constants {
  static var drawerList = [
    NaviItems("Homepage", const HomeView(),
        const Icon(Icons.home, color: Colors.black), Colors.grey),
    NaviItems("Homepage", const HomeView(),
        const Icon(Icons.home, color: Colors.black), Colors.grey),
    NaviItems("Homepage", const HomeView(),
        const Icon(Icons.home, color: Colors.black), Colors.grey),
  ];
}
