import 'package:decooj_buyers/features/profile_fragment/profile_info/profile_info_viewmodel.dart';
import 'package:decooj_buyers/generics/view_model_provider.dart';
import 'package:decooj_buyers/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';

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
                child: FlatButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlacePicker(
                        apiKey: APIKeys.apiKey,   // Put YOUR OWN KEY here.
                        onPlacePicked: (result) {
                          print(result.address);
                          Navigator.of(context).pop();
                        },
                        initialPosition: HomePage.kInitialPosition,
                        useCurrentLocation: true,
                      ),
                    ),
                  );
                },
                child: Text("map"),),

              ),
            ),
          );
        });
  }
}
