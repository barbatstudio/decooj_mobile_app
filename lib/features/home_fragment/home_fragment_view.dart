import 'package:carousel_slider/carousel_slider.dart';
import 'package:decooj_buyers/features/home_fragment/home_fragment_viewmodel.dart';
import 'package:decooj_buyers/features/main_screen/main_screen_view.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/model/product_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/product_slider_widget.dart';
import 'package:decooj_buyers/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class HomeFragmentView extends StatefulWidget {
  @override
  _HomeFragmentViewState createState() => _HomeFragmentViewState();
}

class _HomeFragmentViewState extends State<HomeFragmentView> {
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeFragmentViewModel>(
      viewModel: HomeFragmentViewModel(
          context: context, textEditingController: _typeAheadController),
      builder: (viewModel) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBarWidget(
                  onSudgestionCallBack: (sudgestion) {
                    return viewModel.getSudgestions(sudgestion);
                  },
                  textEditingController: _typeAheadController,
                  onSudgestionSelected: (sudgestion) {
                    print(sudgestion);
                    viewModel.onSudgestionSelected(sudgestion);
                  },
                  hint: "جست و جوی محصول",
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.90,
                  // height: MediaQuery.of(context).size.height * 0.40,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('images/main_slider_bg.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          return SliderWidget(
                            model: SliderModel(
                                AssetImage('images/sample_slide_1.png'),
                                'شرکت در مسابقه',
                                'https://google.com',
                                'مسابقه طراحی مبلمان کوچه مبل'),
                          );
                        },
                        options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              viewModel.updateSliderIndicator(index);
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(child: viewModel.sliderIndicator),
                    ],
                  ),
                ), // Slider 1

                SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
                  width: MediaQuery.of(context).size.width,
                  color: kPrimaryColor,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'از مشتری تا تولید کننده',
                          style:
                              kTitleTextStyle.copyWith(color: kSecondaryColor),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'نیازمندی های خود را در ',
                              style: kTitleTextStyle.copyWith(
                                  color: Colors.white, fontSize: 17),
                              children: [
                                TextSpan(
                                  text: 'دکوژ ',
                                  style: kTitleTextStyle.copyWith(
                                      color: kAccentColor, fontSize: 17),
                                ),
                                TextSpan(
                                  text: 'بیابید',
                                  style: kTitleTextStyle.copyWith(
                                      color: Colors.white, fontSize: 17),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد ',
                          style:
                              kMessageTextStyle.copyWith(color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: kAccentColor,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: kAccentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: CarouselSlider.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int itemIndex) {
                              return ProductsSliderWidget(
                                model: ProductModel(
                                    image: AssetImage('images/mobl_2.png'),
                                    name: 'مبل یک نفره جدید',
                                    price: '۲،۳۴۲،۲۳۱',
                                    priceBefore: '۲،۵۴۲،۲۱۳'),
                              );
                            },
                            options: CarouselOptions(
                                height:
                                    350,
                                viewportFraction: 0.6,
                                autoPlay: false,
                                onPageChanged: (index, reason) {
                                  viewModel.updateSliderIndicator(index);
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ), // Slider 2
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'درباره دکوژ',
                            style:
                                kTitleTextStyle.copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kGreenColor),
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kGreenColor),
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kGreenColor),
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        kLoremIpsum,
                        style: kMessageTextStyle.copyWith(color: Colors.black),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: kAccentColor,
                            child: Text(
                              'پنل فروشندگان',
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: kSecondaryColor,
                            child: Text(
                              'پنل فروشندگان',
                              style:
                                  kTitleTextStyle.copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'دکوژ در شبکه اجتماعی',
                        style:
                            kTitleTextStyle.copyWith(color: kAccentTextColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kAccentTextColor,
                            ),
                            child: Icon(
                              FontAwesome.twitter,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(8),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kAccentTextColor,
                            ),
                            child: Icon(
                              FontAwesome.instagram,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(8),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kAccentTextColor,
                            ),
                            child: Icon(
                              FontAwesome.facebook,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(8),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kAccentTextColor,
                            ),
                            child: Icon(
                              FontAwesome.linkedin,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(8),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/video_bg.png'),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  viewModel.launchVideoUrl();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kSecondaryColor),
                                  child: Icon(
                                    Icons.play_arrow_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'مطالعه بیشتر',
                              textAlign: TextAlign.center,
                              style: kTitleTextStyle.copyWith(
                                  color: Colors.white),
                            ),
                            color: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Text(
                            'تازه ترین های مجله',
                            style: kTitleTextStyle.copyWith(
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: viewModel.postListView,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



class SliderWidget extends StatelessWidget {
  final SliderModel model;

  const SliderWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(
                // color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: model.image, fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: FlatButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.all(10),
                      color: kPrimaryColor,
                      child: Text(
                        model.label,
                        textAlign: TextAlign.right,
                        style: kTitleTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            model.message,
            style: kTitleTextStyle.copyWith(color: kPrimaryColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class SliderModel {
  final ImageProvider image;
  final String label;
  final String link;
  final String message;

  SliderModel(this.image, this.label, this.link, this.message);
}

class WordpressCardWidget extends StatelessWidget {
  final int id;
  final String title;
  final String body;
  final String image;
  final Function(int id) onReadMoreClick;
  final String link;

  const WordpressCardWidget(
      {Key key,
      this.id,
      this.title,
      this.body,
      this.image,
      this.link,
      this.onReadMoreClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.5,
      margin: EdgeInsets.all(15),
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,

            ),
            child: GestureDetector(
              onTap: () async{
                if (await canLaunch(link)) {
                  await launch(link);
                } else {
                  throw 'Could not launch ${link}';
                }
              },
              child: Image(
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.3,
                image: image != null
                    ? NetworkImage(image)
                    : AssetImage('images/video_bg.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: kTitleTextStyle.copyWith(color: kPrimaryColor),
              ),
              SizedBox(width: 20),
              Container(
                width: 30,
                height: 5,
                color: kPrimaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            body,
            textAlign: TextAlign.end,
            maxLines: 5,
            style: kMessageTextStyle.copyWith(color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
