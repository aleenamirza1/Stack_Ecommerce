import 'package:EcomStack/ui/common/app_colors.dart';
import 'package:EcomStack/ui/views/home/Mainhome/mainHome_viewmodel.dart';
import 'package:EcomStack/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedTab = 0;
  changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainHomeViewModel>.reactive(
        viewModelBuilder: () => MainHomeViewModel(),
        builder: (context, viewmodel, child) => Scaffold(
              body: _pages[_selectedTab],
              bottomNavigationBar: Theme(
                  data: ThemeData(canvasColor: Colors.white),
                  child: BottomNavigationBar(
                      currentIndex: _selectedTab,
                      onTap: (index) => changeTab(index),
                      selectedItemColor: PrimaryColor,
                      unselectedItemColor: Colors.black,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: "home",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.favorite),
                          label: "fav",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart),
                          label: "Cart",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: "profile",
                        )
                      ])),
            ));
  }
}

List _pages = [
  const Center(child: HomeView()),
  const Center(child: HomeView()),
  const Center(child: HomeView()),
  const Center(child: HomeView()),
];
