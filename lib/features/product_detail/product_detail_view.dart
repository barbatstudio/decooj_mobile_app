import 'dart:ui';

import 'package:decooj_buyers/features/product_detail/product_dertail_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/model/product_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/color_selector_widget.dart';
import 'package:decooj_buyers/widgets/drop_down_widget.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:decooj_buyers/widgets/product_details_slider_widget.dart';
import 'package:decooj_buyers/widgets/special_product_desc_widget.dart';
import 'package:decooj_buyers/widgets/two_tab_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel model;

  ProductDetailView({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProductDetailViewModel>(
        viewModel: ProductDetailViewModel(context: context, model: model),
        builder: (viewModel) {
          return SafeArea(
            child: MainScaffoldWidget(
              onBackClick: () {
                Navigator.pop(context);
              },
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductDetailSliderWidget(
                        imagesUrl: model.images,
                        productName: model.name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'انتخاب رنگ',
                              style: kTitleTextStyle.copyWith(
                                  color: kPrimaryColor),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ColorSelectorWidget(
                              colors: viewModel.colors,
                              onSelectColor: (selectedColor) {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'انتخاب جنس پشتی',
                              style: kTitleTextStyle.copyWith(
                                  color: kPrimaryColor),
                              textAlign: TextAlign.right,
                            ),
                            DropDownWidget(
                              width: double.infinity,
                              hint: '',
                              items: viewModel.features,
                              currentVal: viewModel.selected,
                              onSelectItem: (selected) {
                                viewModel.updateSelectedFeature(selected);
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TwoTabTextWidget(
                        title_1: 'مشخصات',
                        title_2: 'توضیحات',
                        tabActivecolor: kTabActive,
                        tabDeActivecolor: kTabDeActive,
                        data_1:
                            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخ',
                        data_2:
                            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخ123123',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'محصولات مرتبط',
                          style: kTitleTextStyle.copyWith(color: kPrimaryColor),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        child: viewModel.productListView,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'مشاهده نظرات کاربران',
                                  style: kTitleTextStyle.copyWith(
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Icon(
                                Icons.comment_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${viewModel.commentCount}',
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2,)
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.17,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                model.priceBefore,
                                textAlign: TextAlign.left,
                                style: kTitleTextStyle.copyWith(
                                    color: kHintTextColor,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                model.price + ' تومان ',
                                maxLines: 2,
                                style: kTitleTextStyle.copyWith(
                                  color: kAccentColor,
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'زمان ارسال',
                                  style: kMessageTextStyle.copyWith(
                                      color: kPrimaryColor),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image(
                                    image: AssetImage(
                                        'images/ic_delivery_truck.png')),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '1 تا 2 روز کاری',
                                  style: kMessageTextStyle.copyWith(
                                      color: kPrimaryColor),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                ))
                          ],
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: kPrimaryColor,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'اضافه به سبد خرید',
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              showDialog(context: context, builder: (context){
                                return SpecialProductDescWidget(onSubmitClick: (description){
                                  print(description);
                                },);
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: kAccentColor,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'سفارشی سازی',
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
