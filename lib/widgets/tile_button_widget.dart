import 'package:flutter/material.dart';

class TileButtonWidget extends StatefulWidget {
  final VoidCallback? removeOnPressed;
  const TileButtonWidget({this.removeOnPressed, Key? key}) : super(key: key);

  @override
  State<TileButtonWidget> createState() => _TileButtonWidgetState();
}

class _TileButtonWidgetState extends State<TileButtonWidget> {
  Color? backgroundColor;
  Color? backgroundColorSetting;
  Color? backgroundColortrash;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 197, 54, 109),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              width: 270,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                  // fontSize: 15,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Click to edit...',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 223, 148, 179),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          MouseRegion(
            onHover: (_) {
              setState(() {
                backgroundColorSetting =
                    const Color.fromARGB(255, 185, 95, 137);
              });
            },
            onExit: (_) {
              setState(() {
                backgroundColorSetting = null;
              });
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: backgroundColorSetting,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 19,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          MouseRegion(
            onHover: (_) {
              setState(() {
                backgroundColortrash = const Color.fromARGB(255, 185, 95, 137);
              });
            },
            onExit: (_) {
              setState(() {
                backgroundColortrash = null;
              });
            },
            child: InkWell(
              onTap: widget.removeOnPressed,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: backgroundColortrash,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.restore_from_trash,
                  color: Colors.white,
                  size: 19,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 35,
          ),
        ],
      ),
    );
  }
}
