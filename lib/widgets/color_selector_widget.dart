import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ColorSelectorWidget extends StatefulWidget {
  final List<Color> colors;
  final Function(Color selectedColor) onSelectColor;

  const ColorSelectorWidget({Key key, this.colors, this.onSelectColor})
      : super(key: key);

  @override
  _ColorSelectorWidgetState createState() => _ColorSelectorWidgetState();
}

class _ColorSelectorWidgetState extends State<ColorSelectorWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
          itemCount: widget.colors.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = i;
                });
                widget.onSelectColor(widget.colors[i]);
              },
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: selectedIndex == i
                        ? Border.all(color: kPrimaryColor,width: 3)
                        : null,
                    color: widget.colors[i],
                    borderRadius: BorderRadius.circular(5)),
              ),
            );
          }),
    );
  }
}
