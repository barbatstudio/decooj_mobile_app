import 'package:decooj_buyers/features/category_fragment/subcategory/subcategory_view.dart';
import 'package:decooj_buyers/features/home_fragment/home_fragment_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/model/category_model.dart';
import 'package:decooj_buyers/widgets/cetegory_btn_widget.dart';
import 'package:decooj_buyers/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_fragment_viewmodel.dart';

class CategoryFragmentView extends StatefulWidget {
  @override
  _CategoryFragmentViewState createState() => _CategoryFragmentViewState();
}

class _CategoryFragmentViewState extends State<CategoryFragmentView> {
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CategoryFragmentViewModel>(
      viewModel: CategoryFragmentViewModel(
          context: context, textEditingController: _typeAheadController),
      builder: (viewModel) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              Expanded(
                child: Center(
                  child: Container(
                    alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width * 0.9,

                    height: MediaQuery.of(context).size.height * 0.56,
                    child: GridView.builder(
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, i) {
                        return CategoryBtnWidget(
                          onSelectCategory: (model) {
                            print("selected Category: ${model.name}");
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>SubCategoryView(categoryId: 1,)));
                          },
                          model: CategoryModel(id: i, name: 'دسته بندی ${i + 1}',image: AssetImage('images/category_pic_1.png')),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
