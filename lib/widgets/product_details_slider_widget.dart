import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailSliderWidget extends StatefulWidget {
  final List<String> imagesUrl;
  final String productName;

  ProductDetailSliderWidget({Key key, this.imagesUrl, this.productName})
      : super(key: key);

  @override
  _ProductDetailSliderWidgetState createState() =>
      _ProductDetailSliderWidgetState();
}

class _ProductDetailSliderWidgetState extends State<ProductDetailSliderWidget> {
  int selectedPicIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      widget.productName,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: kTitleTextStyle.copyWith(color: kPrimaryColor),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: 10, left: 10, top: 20, bottom: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (selectedPicIndex > 0) {
                              setState(() {
                                selectedPicIndex--;
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kHintTextColor,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_left_sharp,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Image(
                            fit: BoxFit.scaleDown,
                            width: 100,
                            height: 150,
                            image: widget.imagesUrl[selectedPicIndex] == null ||
                                    widget.imagesUrl[selectedPicIndex] == ''
                                ? AssetImage('images/mobl_2.png')
                                : NetworkImage(
                                    widget.imagesUrl[selectedPicIndex]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (selectedPicIndex < widget.imagesUrl.length-1) {
                              setState(() {
                                selectedPicIndex++;
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kHintTextColor,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.imagesUrl.length,
                    itemBuilder: (context, i) {
                      return Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: selectedPicIndex == i ? Border.all(color: kPrimaryColor) : null,
                            color: Colors.white,
                            boxShadow: [kBoxShadow],
                            borderRadius: BorderRadius.circular(10)),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              selectedPicIndex = i;
                            });
                          },
                          child: Image(
                            fit: BoxFit.scaleDown,
                            width: 60,
                            height: 60,
                            image: widget.imagesUrl[selectedPicIndex] == null ||
                                    widget.imagesUrl[selectedPicIndex] == ''
                                ? AssetImage('images/mobl_2.png')
                                : NetworkImage(
                                    widget.imagesUrl[selectedPicIndex],
                                  ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
