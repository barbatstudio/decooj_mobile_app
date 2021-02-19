import 'package:decooj_buyers/features/category_fragment/subcategory/subcategtory_viewmodel.dart';
import 'package:decooj_buyers/features/main_screen/main_screen_view.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:decooj_buyers/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategoryView extends StatelessWidget {
  final int categoryId;
  final TextEditingController _typeAheadController = TextEditingController();

  SubCategoryView({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SubCategoryViewModel>(
      viewModel: SubCategoryViewModel(
          context: context,
          categoryId: categoryId,
          textEditingController: _typeAheadController),
      builder: (viewModel) {
        return SafeArea(
            child: MainScaffoldWidget(
          onBackClick: () {
            Navigator.pop(context);
          },
          body: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
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
                    height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width,
                      child: viewModel.subCategoriesListView),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text('جدیدترین ها',
                        style: kTitleTextStyle.copyWith(color: Colors.black),
                        textAlign: TextAlign.start),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: viewModel.topRatedProductsListView),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text('پرفروشترین ها',
                        style: kTitleTextStyle.copyWith(color: Colors.black),
                        textAlign: TextAlign.start),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,

                      child: viewModel.topSaleProductsListView),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
