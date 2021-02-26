import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

import 'home_fragment_view.dart';

class HomeFragmentViewModel extends BaseViewModel {
  Widget postListView = LoadingWidget();

  final BuildContext context;
  final TextEditingController textEditingController;
  Widget sliderIndicator = Container();

  HomeFragmentViewModel({this.context, this.textEditingController})
      : super(context: context) {
    sliderIndicator = getSliderIndicator(0);
    getWordpressPosts();
  }

  launchVideoUrl() async {
    const url =
        'https://site.f.fajrak.barbatstudio.com/uploads/app/Projects/d17bf61dbe789a5c793f312502354d49.mp4';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getWordpressPosts() async {
    wp.WordPress wordPress;
    // http://decooj.com/magazine/wp-json/wp/v2/posts
// adminName and adminKey is needed only for admin level APIs
    wordPress = wp.WordPress(
      baseUrl: 'http://decooj.com/magazine/',
      authenticator: wp.WordPressAuthenticator.ApplicationPasswords,
      adminName: '',
      adminKey: '',
    );

    List<wp.Post> posts = await wordPress.fetchPosts(
      postParams: wp.ParamsPostList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 20,
        order: wp.Order.desc,
        orderBy: wp.PostOrderBy.date,
      ),
      fetchAuthor: true,
      fetchFeaturedMedia: true,
      fetchComments: true,
    );
    posts.forEach((p) {
      print(
          'id: ${p.id}, title: ${p.title.rendered}, '
              'content: ${p.excerpt.rendered} , media:${p.featuredMedia.sourceUrl}, postUrl: ${p.link}');
    });

    postListView = ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posts.length,
        itemBuilder: (context, i) {
          return WordpressCardWidget(
            title: posts[i].title.rendered,
            body: posts[i].excerpt.rendered,
            image: posts[i].featuredMedia.sourceUrl,
            link: posts[i].link,
            id: i,

          );
        });
    notifyListeners();
  }

  List<String> getSudgestions(String query) {
    return [
      'پیشنهاد ۱',
      'پیشنهاد ۶',
      'پیشنهاد ۷',
      'پیشنهاد ۲',
      'پیشنهاد ۳',
      'پیشنهاد ۴',
      'پیشنهاد ۵',
    ];
  }

  void updateSliderIndicator(int index) {
    sliderIndicator = getSliderIndicator(index);
    notifyListeners();
  }

  Widget getSliderIndicator(int selected) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected == 0 ? kSecondaryColor : kAccentColor),
          ),
          SizedBox(
            width: 2,
          ),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected == 1 ? kSecondaryColor : kAccentColor),
          ),
          SizedBox(
            width: 2,
          ),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected == 2 ? kSecondaryColor : kAccentColor),
          ),
          SizedBox(
            width: 2,
          ),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected == 3 ? kSecondaryColor : kAccentColor),
          ),
        ],
      );

  void onSudgestionSelected(String query) {
    textEditingController.text = query;
    notifyListeners();
  }
}
