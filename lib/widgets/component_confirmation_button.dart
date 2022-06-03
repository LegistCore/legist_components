import 'package:flutter/material.dart';

class ComponentConfirmationButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String textComponent;

  final bool showHint;

  const ComponentConfirmationButton({
    required this.textComponent,
    required this.onPressed,
    required this.showHint,
    Key? key,
  }) : super(key: key);

  @override
  State<ComponentConfirmationButton> createState() =>
      _ComponentConfirmationButtonState();
}

class _ComponentConfirmationButtonState
    extends State<ComponentConfirmationButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 37,
          child: TextButton(
            onPressed: widget.onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.textComponent,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 24, 71, 169),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        widget.showHint == true
            ? Row(
                children: const [
                  Text(
                    'press',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Enter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  Icon(
                    Icons.subdirectory_arrow_left,
                    size: 10,
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
