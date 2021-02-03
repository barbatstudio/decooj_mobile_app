import 'package:decooj_buyers/model/category_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryBtnWidget extends StatefulWidget {
  final Function(CategoryModel selected) onSelectCategory;
  final CategoryModel model;

  const CategoryBtnWidget({Key key, this.onSelectCategory, this.model})
      : super(key: key);

  @override
  _CategoryBtnWidgetState createState() => _CategoryBtnWidgetState();
}

class _CategoryBtnWidgetState extends State<CategoryBtnWidget> {
  Color bgColor = Color(0xAA40312E);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: (){
        setState(
              () {
            bgColor = Color(0xAA40312E);
          },
        );
      },
      onTapDown: (tap){
        setState(
              () {
            bgColor = Color(0xAA53B9B6);
          },
        );
      },
      onTapUp: (tap){
        setState(
              () {
            bgColor = Color(0xAA40312E);
          },
        );
      },
      onTap: () {

        widget.onSelectCategory(widget.model);
      },
      child: Container(

        margin: EdgeInsets.all(5),
      
        decoration: BoxDecoration(
          image: DecorationImage(
            image: widget.model.image,
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16),


        ),
        child: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: bgColor,

          ),

          child: Center(
            child: Text(
              widget.model.name,
              style: kTitleTextStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
