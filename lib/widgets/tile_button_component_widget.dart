import 'package:flutter/material.dart';

class TileButtonComponentWidget extends StatefulWidget {
  final VoidCallback? removeOnPressed;
  const TileButtonComponentWidget({this.removeOnPressed, Key? key})
      : super(key: key);

  @override
  State<TileButtonComponentWidget> createState() =>
      _TileButtonComponentWidgetState();
}

class _TileButtonComponentWidgetState extends State<TileButtonComponentWidget> {
  Color? backgroundColor;
  Color? backgroundColorSetting;
  Color? backgroundColortrash;
  @override
  Widget build(BuildContext context) {
    double medidaInterna = 15;
    double medidaExterna = 19;
    List<BoxShadow>? shadow;

    return Container(
      width: 240,
      height: 42,
      margin: const EdgeInsets.only(bottom: 2),
      child: Stack(
        children: [
          Container(
            width: 225,
            height: 42,
            margin: const EdgeInsets.only(left: 7.5),
            padding: const EdgeInsets.only(bottom: 12, left: 15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 197, 54, 109),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                      // fontSize: 15,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Click here to edit',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 223, 148, 179),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 11,
            child: MouseRegion(
              onHover: (event) {
                setState(() {
                  medidaInterna = 20;
                  medidaExterna = 25;
                  shadow = [
                    const BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset(0.0, 0.75),
                    ),
                  ];
                });
              },
              onExit: (event) {
                setState(() {
                  medidaInterna = 17;
                  medidaExterna = 21;
                  shadow = null;
                });
              },
              child: Container(
                width: medidaExterna,
                height: medidaExterna,
                decoration: BoxDecoration(
                  boxShadow: shadow,
                  color: const Color.fromARGB(255, 243, 242, 251),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: medidaInterna,
                    height: medidaInterna,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 56, 200, 152),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
