import 'package:decooj_buyers/features/cart_fragment/cart_model.dart';
import 'package:decooj_buyers/features/login_flow/get_phone/get_phone_view.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/bascket_card_widget.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartViewModel extends BaseViewModel {
  final BuildContext context;
  Widget cartListView = LoadingWidget();
  List<CartModel> carts = [
    CartModel(
      id: 1,
      imageUrl: '',
      title: 'مبل راحتی دو نفره خانه پلاس مدل ایساتیس',
      storeName: 'فروشگاه یاسر و دوستان',
      price: '1250000000',
      selectedColor: Colors.red,
      feature: 'چوبی',
      type: ORDER_TYPE_NORMAL,
      count: 1,
      specialDesc: '',
    ),
    CartModel(
      id: 2,
      imageUrl: '',
      title: 'مبل راحتی دو نفره خانه پلاس مدل ایساتیس',
      storeName: 'فروشگاه یاسر و دوستان',
      price: '1250000000',
      selectedColor: Colors.blue,
      feature: 'چوبی',
      type: ORDER_TYPE_SPECIAL,
      count: 1,
      specialDesc:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخ',
    ),
    CartModel(
      id: 3,
      imageUrl: '',
      title: 'مبل راحتی دو نفره خانه پلاس مدل ایساتیس',
      storeName: 'فروشگاه یاسر و دوستان',
      price: '1250000000',
      selectedColor: Colors.green,
      feature: 'چوبی',
      type: ORDER_TYPE_SPECIAL,
      count: 1,
      specialDesc:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخ',
    ),
    CartModel(
      id: 4,
      imageUrl: '',
      title: 'مبل راحتی دو نفره خانه پلاس مدل ایساتیس',
      storeName: 'فروشگاه یاسر و دوستان',
      price: '1250000000',
      selectedColor: Colors.yellow,
      feature: 'چوبی',
      type: ORDER_TYPE_NORMAL,
      count: 1,
      specialDesc: '',
    ),
  ];

  bool isLogedIn = false;

  CartViewModel({this.context}) : super(context: context) {
    checkLogin();
    getCart();
  }

  void updateLogin() {
    isLogedIn = !isLogedIn;
    getCart();
  }

  void getCart() async {
    if (!isLogedIn) {
      cartListView = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            isLogedIn
                ? "سبد خرید شما خالی است"
                : "لطفا وارد پروفایل کاربری خود شوید ",
            style: kTitleTextStyle.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          isLogedIn
              ? Container()
              : FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GetPhoneView()));
                  },
                  child: Text(
                    'ورود/ثبت نام',
                    style: kTitleTextStyle.copyWith(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(10),
                  color: kGreenColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
        ],
      );
    } else {
      cartListView = ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, i) {
          return BasketCardWidget(
            onModelChange: (model) {},
            model: carts[i],
            index: i,
          );
        },
      );
    }
    notifyListeners();
  }

  void checkLogin() {
    isLogedIn = false;
    notifyListeners();
  }
}
