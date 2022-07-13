import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/tile_button_widget.dart';

class SideMenuButtons extends StatefulWidget {
  final VoidCallback? onPressedAdd;

  const SideMenuButtons({
    this.onPressedAdd,
    Key? key,
  }) : super(key: key);
  static const String routeName = '/side_menu_buttons';
  @override
  State<SideMenuButtons> createState() => _SideMenuButtonsState();
}

class _SideMenuButtonsState extends State<SideMenuButtons> {
  Color? color;
  late Size screen;
  Color? backgroundColor;
  Color? backgroundColorSetting;
  Color? backgroundColortrash;

  List<Widget> items = [];

  addOption() {
    setState(() {
      final int index = items.length;
      items.add(TileButtonWidget(
        key: Key(index.toString()),
        removeOnPressed: () {
          debugPrint('remove index $index');
          removeOption(index);
        },
      ));
    });
  }

  removeOption(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  Key generateKey() {
    final random = Random();
    final first = random.nextDouble();
    final second = random.nextInt(20);
    final third = random.nextDouble();

    return Key('$first$second$third');
  }

  @override
  void initState() {
    items.add(TileButtonWidget(
      key: const Key('0'),
      removeOnPressed: () {
        removeOption(0);
      },
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              color: const Color.fromARGB(255, 247, 247, 247),
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 204, 204, 204),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.photo_camera,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'BUTTONS',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 60, 66, 94),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'How to use',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 76, 86, 216),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(Icons.collections_bookmark_outlined,
                                    color: Color.fromARGB(255, 76, 86, 216),
                                    size: 15),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 28,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MouseRegion(
                                  onHover: (_) {
                                    setState(() {
                                      color = const Color.fromARGB(
                                          255, 206, 204, 204);
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      color = null;
                                    });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: color,
                                      ),
                                      child: const Center(
                                          child: Icon(Icons.close, size: 20))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Advanced buttons editor',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 60, 66, 94),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Color.fromARGB(255, 60, 66, 94),
                    child: Column(children: [
                      ReorderableListView(
                        shrinkWrap: true,
                        buildDefaultDragHandles: true,
                        children: 
                        items,
                        // List.generate(
                        //   items.length,
                        //   (index) => ReorderableDragStartListener(
                        //     child: items[index],
                        //     index: index,
                        //     key: Key('$index'),
                        //   ),
                        // ),
                        onReorder: (int oldIndex, int newIndex) {
                          print(oldIndex);
                          print(newIndex);
                          setState(() {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }

                            final item = items.removeAt(oldIndex);

                            items.insert(newIndex, item);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          addOption();
                        },
                        child: SizedBox(
                            // margin: const EdgeInsets.only(top: 5),
                            height: 40,
                            child: Stack(
                              children: [
                                Container(
                                  height: 40,
                                  width: screen.width * 0.258,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 51, 53, 81),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Add another button',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
                  )

                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 80,
          color: const Color.fromARGB(255, 51, 53, 80),
          child: Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              const Expanded(
                child: SizedBox(
                  child: Text('APPLY CHANGES ?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              SizedBox(
                height: 35,
                width: 75,
                child: TextButton(
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 60, 66, 94),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 33,
                width: 75,
                child: TextButton(
                  child: const Text(
                    'APPLY',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 197, 54, 109),
                  ),
                  onPressed: widget.onPressedAdd,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          ),
        )
      ],
    );
  }
}
