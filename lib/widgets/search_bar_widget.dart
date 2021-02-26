import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onSudgestionCallBack;
  final Function onSudgestionSelected;
  final String hint;
  final TextEditingController textEditingController;

  const SearchBarWidget(
      {Key key,
      this.onSudgestionCallBack,
      this.onSudgestionSelected,
      this.hint,
      this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      width: MediaQuery.of(context).size.width ,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(color: kHintTextColor),
          ),
      padding: EdgeInsets.only(left: 5,right: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: kTitleTextStyle.copyWith(
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kAccentColor,width: 1.0),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,

                    ),
                  ),
                  itemBuilder: (BuildContext context, itemData) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(right: 10),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          itemData,
                          style: kTitleTextStyle.copyWith(color: kPrimaryColor),
                        ),
                      ),
                    );
                  },
                  onSuggestionSelected: (sudgestion) {
                    onSudgestionSelected(sudgestion);
                  },
                  suggestionsCallback: onSudgestionCallBack,
                ),
              ),
            ),
          ),
          VerticalDivider(width: 10,color: kHintTextColor,thickness: 1.5,),

          Image(
            image: AssetImage('images/ic_magnifier.png'),
          )
        ],
      ),
    );
  }
}
