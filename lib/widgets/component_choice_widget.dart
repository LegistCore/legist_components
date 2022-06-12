import 'package:flutter/material.dart';
import 'package:legist_components/utils/alphabet_utils.dart';

class ComponentChoiceWidget extends StatefulWidget {
  late bool isEditMode;
  final int index;

  final VoidCallback? onPressed;

  ComponentChoiceWidget({
    required this.onPressed,
    required this.index,
    required this.isEditMode,
    Key? key,
  }) : super(key: key);

  @override
  State<ComponentChoiceWidget> createState() => _ComponentChoiceWidgetState();
}

class _ComponentChoiceWidgetState extends State<ComponentChoiceWidget> {
  bool eye = false;
  Icon? icone;
  AlphabetUtils alphabetUtils = AlphabetUtils();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!widget.isEditMode) {
          setState(() {
            icone == null
                ? icone = const Icon(
                    Icons.check,
                    color: Color.fromRGBO(24, 71, 169, 1),
                  )
                : icone = null;
          });
        } else {
          icone = null;
        }
      },
      child: Stack(
        children: [
          const SizedBox(
            width: 300,
            height: 45,
          ),
          MouseRegion(
            onHover: (event) {
              debugPrint('atualizamdp aqui${widget.index}');
              if (widget.isEditMode) {
                setState(() {
                  eye = true;
                });
              }
            },
            onExit: (event) {
              // debugPrint('atualizamdp aqui${widget.index}');
              if (widget.isEditMode) {
                setState(() {
                  eye = false;
                });
              } else {
                icone = null;
              }
            },
            child: MouseRegion(
              child: Container(
                padding: const EdgeInsets.all(6),
                width: 150,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 233, 245),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color.fromARGB(255, 124, 149, 205),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                          color: const Color.fromARGB(255, 124, 149, 205),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          alphabetUtils.alphabetList[widget.index],
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(24, 71, 169, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: TextField(
                        enabled: eye,
                        decoration: InputDecoration(
                          suffixIcon: icone,
                          border: InputBorder.none,
                          hintText: 'choice',
                          hintStyle: const TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(24, 71, 169, 1),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(24, 71, 169, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 140,
            bottom: 16,
            child: Visibility(
              visible: widget.isEditMode ? eye : false,
              child: MouseRegion(
                onHover: (event) {
                  debugPrint('atualizamdp aqui${widget.isEditMode}');
                  if (widget.isEditMode) {
                    setState(() {
                      eye = true;
                    });
                  }
                },
                onExit: (event) {
                  debugPrint('atualizamdp aqui${widget.isEditMode}');
                  if (widget.isEditMode) {
                    setState(() {
                      eye = false;
                    });
                  }
                },
                child: SizedBox(
                  height: 22,
                  width: 22,
                  child: FloatingActionButton(
                    backgroundColor: Colors.grey.shade900,
                    child: const Text("X"),
                    elevation: 5.0,
                    onPressed: widget.onPressed,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
