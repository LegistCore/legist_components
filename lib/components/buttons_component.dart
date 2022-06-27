import 'package:flutter/material.dart';
import 'package:legist_components/widgets/tile_button_component_widget.dart';

class ButtonsComponent extends StatefulWidget {
  List<TileButtonComponentWidget> listTile = [];

  ButtonsComponent({required this.listTile, Key? key}) : super(key: key);

  @override
  State<ButtonsComponent> createState() => _ButtonsComponentState();
}

class _ButtonsComponentState extends State<ButtonsComponent> {
  late Size screen;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          child: Row(
            children: [
              const SizedBox(
                child: Icon(
                  Icons.photo_camera,
                  color: Color.fromARGB(255, 60, 66, 94),
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Buttons',
                style: TextStyle(
                  color: Color.fromARGB(255, 60, 66, 94),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MouseRegion(
                            onHover: (_) {
                              setState(() {
                                backgroundColor =
                                    const Color.fromARGB(255, 225, 227, 231);
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                backgroundColor = null;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              width: 30,
                              height: 30,
                              child: const Icon(
                                Icons.more_horiz_rounded,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          color: const Color.fromARGB(255, 231, 232, 247),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                margin: const EdgeInsets.only(left: 2, top: 2, right: 2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Click to edit...',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        // color: Color.fromARGB(255, 61, 55, 98),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12),
                margin: const EdgeInsets.only(left: 2, top: 2, right: 2),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 242, 242, 242),
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 192, 192, 192),
                      // width: 1,
                    ),
                    left: BorderSide(
                      color: Color.fromARGB(255, 192, 192, 192),
                      // width: 1,
                    ),
                    right: BorderSide(
                      color: Color.fromARGB(255, 192, 192, 192),
                      // width: 1,
                    ),
                  ),
                ),
                height: 25,
                width: screen.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'MESSAGE',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 71, 65, 109),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 231, 232, 247),
          child: Column(
            children: widget.listTile,
          ),
        )
      ],
    );
  }
}
