
import 'package:decooj_buyers/features/profile_fragment/profile_info/profile_info_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/tools/helper.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:decooj_buyers/widgets/map_fragment.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class ProfileInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProfileInfoViewModel>(
        viewModel: ProfileInfoViewModel(context: context),
        builder: (viewModel) {
          return SafeArea(
            child: MainScaffoldWidget(
              onBackClick: () {
                Navigator.pop(context);
              },
              body: Container(
                child: FlatButton(onPressed: () async{
                  bool location = await Helper.getPermission();
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>MapSample()));
                },
                child: Text("map"),),

              ),
            ),
          );
        });
  }
}
