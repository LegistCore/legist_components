import 'package:flutter/material.dart';

class BaseComponentWidget extends StatefulWidget {
  final String? questionType;
  final String? questionText;
  final IconData? icon;

  const BaseComponentWidget({
    required this.icon,
    required this.questionType,
    required this.questionText,
    Key? key,
  }) : super(key: key);

  @override
  State<BaseComponentWidget> createState() => _BaseComponentWidgetState();
}

class _BaseComponentWidgetState extends State<BaseComponentWidget> {
  double medidaInterna = 17;
  double medidaExterna = 21;
  List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 238,
      height: 70,
      child: Stack(
        children: [
          Container(
            width: 230,
            height: 62,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 243, 242, 251),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  child: Icon(
                    widget.icon,
                    color: Colors.blue[300],
                    size: 30,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.questionType!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 60, 66, 94),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          widget.questionText!,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 22,
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
