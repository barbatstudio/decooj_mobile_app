import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:decooj_buyers/features/main_screen/main_screen_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/my_custom_icons_icons.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreenView extends StatefulWidget {
  @override
  _MainScreenViewState createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {


  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainScreenViewModel>(
      viewModel: MainScreenViewModel(
          context: context,),
      builder: (viewModel) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: kMainBgColor,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(boxShadow: [kBottomNavShadow]),
              child: CustomBottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.white,
                unselectedItemColor: kPrimaryColor,
                itemOutlineColor: kMainBgColor,
                itemBackgroudnColor: kAccentColor,
                currentIndex: kFragmentHome,
                onTap: (index) {
                  viewModel.changeFragment(index);
                },
                items: [
                  CustomBottomNavigationBarItem(
                    icon: MyCustomIcons.ic_profile,
                    title: "پروفایل",
                    titleTextStyle:
                        kTitleTextStyle.copyWith(color: kPrimaryColor),
                  ),
                  CustomBottomNavigationBarItem(
                    icon: MyCustomIcons.ic_furniture_chair,
                    title: "سفارشات",
                    titleTextStyle:
                        kTitleTextStyle.copyWith(color: kPrimaryColor),
                  ),
                  CustomBottomNavigationBarItem(
                    icon: MyCustomIcons.ic_layout_right_menu,
                    title: "دسته بندی",
                    titleTextStyle:
                        kTitleTextStyle.copyWith(color: kPrimaryColor),
                  ),
                  CustomBottomNavigationBarItem(
                    icon: MyCustomIcons.ic_real_estate_search_house,
                    title: "خانه",
                    titleTextStyle:
                        kTitleTextStyle.copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  MainAppBarWidget(
                    cartBadgeNumber: 0,
                    onCartIconClick: () {},
                  ),


                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: viewModel.selectedFragment),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MainAppBarWidget extends StatelessWidget {
  final int cartBadgeNumber;
  final Function onCartIconClick;

  const MainAppBarWidget({Key key, this.cartBadgeNumber, this.onCartIconClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          Image(image: AssetImage("images/cart_icon.png")),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 15),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('images/decooj_farsi.png'),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'نگاهی نو به صنعت مبلمان',
                    textAlign: TextAlign.end,
                    style: kTitleTextStyle.copyWith(color: kAccentTextColor),
                  ),
                ],
              ),
            ),
          ),
          Image(image: AssetImage('images/decooj_logo.png'))
        ],
      ),
    );
  }
}
