import 'package:flutter/material.dart';

class ShowCasePresentationButtonWidget extends StatefulWidget {
  final String textComponent;
  final Icon iconComponent;
  final VoidCallback? onPressed;

  const ShowCasePresentationButtonWidget({
    required this.iconComponent,
    required this.textComponent,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<ShowCasePresentationButtonWidget> createState() =>
      _ShowCasePresentationButtonWidgetState();
}

class _ShowCasePresentationButtonWidgetState
    extends State<ShowCasePresentationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 236, 246),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color.fromARGB(255, 124, 149, 205),
        ),
      ),
      width: 160,
      child: TextButton(
        style: const ButtonStyle(),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.iconComponent.icon,
                color: const Color.fromARGB(255, 24, 71, 169)),
            const SizedBox(width: 5),
            Text(
              widget.textComponent,
              style: const TextStyle(
                color: Color.fromARGB(255, 24, 71, 169),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
