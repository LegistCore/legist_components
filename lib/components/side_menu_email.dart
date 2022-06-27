import 'package:flutter/material.dart';

class SideMenuEmail extends StatefulWidget {
  const SideMenuEmail({Key? key}) : super(key: key);

  @override
  State<SideMenuEmail> createState() => _SideMenuEmailState();
}

class _SideMenuEmailState extends State<SideMenuEmail> {
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
                      Icon(
                        Icons.email_outlined,
                        color: Colors.blue[300],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'QUESTION: EMAIL',
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
                  'Question Text',
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
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 192, 192, 192),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  height: 140,
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What’s your email?',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 61, 55, 98),
                        )),
                  ),
                )
              ],
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
                  onPressed: () {},
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
