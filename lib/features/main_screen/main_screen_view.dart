import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:decooj_buyers/features/main_screen/main_screen_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/my_custom_icons_icons.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
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
          child: MainScaffoldWidget(

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
                    icon: Icons.shopping_cart_outlined,
                    title: "سبد خرید",
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


