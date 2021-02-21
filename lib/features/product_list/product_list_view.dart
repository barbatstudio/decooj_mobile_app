import 'package:decooj_buyers/features/product_list/product_list_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:decooj_buyers/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  final TextEditingController _typeAheadController = TextEditingController();
  final int categoryId;

  ProductListView({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProductListViewmodel>(
      viewModel: ProductListViewmodel(
          context: context,
          textEditingController: _typeAheadController,
          categoryId: categoryId),
      builder: (viewModel) {
        return SafeArea(
          child: MainScaffoldWidget(
            onBackClick: () {
              Navigator.pop(context);
            },
            body: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SearchBarWidget(
                      onSudgestionCallBack: (sudgestion) {
                        return Helper.getSudgestions(sudgestion);
                      },
                      textEditingController: _typeAheadController,
                      onSudgestionSelected: (sudgestion) {
                        print(sudgestion);
                        viewModel.onSudgestionSelected(sudgestion);
                      },
                      hint: "جست و جوی محصول",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageBtnWidget(
                          text: Text(
                            'مرتب سازی',
                            style:
                                kTitleTextStyle.copyWith(color: Colors.black),
                          ),
                          image: Image(
                            image: AssetImage('images/ic_sort.png'),
                          ),
                          onClick: () {},
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ImageBtnWidget(
                          text: Text(
                            'فیلتر',
                            style:
                                kTitleTextStyle.copyWith(color: Colors.black),
                          ),
                          image: Image(
                            image: AssetImage('images/ic_filter.png'),
                          ),
                          onClick: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: viewModel.productListView,
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

class ImageBtnWidget extends StatelessWidget {
  final Text text;
  final Image image;
  final Function() onClick;

  ImageBtnWidget({Key key, this.text, this.image, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [kBoxShadow]),
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text,
            SizedBox(
              width: 2,
            ),
            image,
          ],
        ),
      ),
    );
  }
}
