import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Circles extends StatefulWidget {
  const Circles({
    Key? key,
    required this.text,
    required this.picturestring,
  }) : super(key: key);
  final String text;
  final String picturestring;

  @override
  _CircleGenderState createState() => _CircleGenderState();
}

class _CircleGenderState extends State<Circles> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final String pictureExtension = widget.picturestring.split('.').last;
    final bool isSvgPicture = pictureExtension == 'svg';

    Widget pictureWidget;
    // if (isSvgPicture) {
    //   pictureWidget = SvgPicture.asset(
    //     widget.picturestring,
    //     height: 80,
    //     color: _isSelected ? Colors.white : HexColor('#03045e'),
    //   );
    // } else {
    //   pictureWidget = SizedBox(
    //     height: 80,

    //       child: ColorFiltered(
    //     colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
    //     child: Image.asset(widget.picturestring),
    //   ));
    // }

    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0).withOpacity(0.1),
              blurRadius: 30,
            ),
          ],
          color: _isSelected
              ? GlobalColors.mainColor
              : Colors.white, // change color to blue when _isSelected is true
          border: Border.all(
            width: 3,
            color: _isSelected ? HexColor('#ffffff') : HexColor('#03045e'),
          ),
          borderRadius: BorderRadius.circular(75),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              pictureWidget = isSvgPicture
                  ? SvgPicture.asset(
                      widget.picturestring,
                      height: 80,
                      color: _isSelected ? Colors.white : HexColor('#03045e'),
                    )
                  : SizedBox(
                      height: 80,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _isSelected ? Colors.white : HexColor('#03045e'),
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(widget.picturestring),
                      ),
                    ),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18,
                  color: _isSelected ? Colors.white : HexColor('#03045e'),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
