import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shifts_offers/resources/colors.dart';
import 'package:shifts_offers/resources/constants.dart';
import 'package:shifts_offers/resources/styles.dart';
import 'package:shifts_offers/ui/screens/shifts_offers_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    ShiftsOffers(),
    Text(
      'Favorite',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            screenNames.elementAt(_selectedIndex),
            style: sTitleStyle,
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: cSecondColor,
              hoverColor: cSecondColor,
              gap: 20,
              activeColor: cWhiteColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
             tabBackgroundColor: cSecondColor,
              circleColor: cLightGreyColor,
              color: Colors.black,
              tabs:  const [
                GButton(
                //  padding: EdgeInsets.all(15),
                  icon: Icons.search,
                  text: shiftsOffers,
                  textStyle: sBottomTitleStyle,

                ),
                GButton(
                  padding: EdgeInsets.all(15),
                  icon: Icons.wysiwyg_outlined,
                  text: favorite,
                  textStyle: sBottomTitleStyle,
                ),
                GButton(
                  padding: EdgeInsets.all(15),
                  icon: Icons.person_outline,
                  text: profile,
                  textStyle: sBottomTitleStyle,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
