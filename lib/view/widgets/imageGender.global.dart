import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ImageGender extends StatefulWidget {
  const ImageGender({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);
  final String text;
  final String imagePath;

  @override
  _ImageGenderState createState() => _ImageGenderState();
}

class _ImageGenderState extends State<ImageGender> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Column(
        children: [
          Container(
            width: 170,
            height: 300,
            
            decoration: BoxDecoration(
              image: DecorationImage(
                
                  image: AssetImage(widget.imagePath), fit: BoxFit.cover),

              // color: _isSelected ? HexColor('#03045e'): Colors.white, // change color to blue when _isSelected is true

              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(width: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(150, 0, 0, 0).withOpacity(0.1),
                        blurRadius: 15,
                      ),
                    ],
                    color:
                        _isSelected ? HexColor('#03045e') : HexColor('#ffffff'),
                    border: Border.all(
                        width: 3,
                        color: _isSelected
                            ? HexColor('#ffffff')
                            : HexColor('#03045e')),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                const SizedBox(width: 8),
                Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 16,
                      color: HexColor('#03045e'),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
