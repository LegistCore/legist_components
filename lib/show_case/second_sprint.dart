import 'package:flutter/material.dart';
import 'package:legist_components/components/question_date_component.dart';
import 'package:legist_components/components/question_email_component.dart';
import 'package:legist_components/components/question_text_component.dart';
import 'package:legist_components/components/side_menu_buttons.dart';
import 'package:legist_components/components/side_menu_date.dart';
import 'package:legist_components/components/side_menu_email.dart';
import 'package:legist_components/components/side_menu_phone.dart';
import 'package:legist_components/components/side_menu_text.dart';
import 'package:legist_components/widgets/tile_button_component_widget.dart';

import '../components/buttons_component.dart';
import '../components/question_phone_component.dart';

class SecondSprint extends StatefulWidget {
  const SecondSprint({Key? key}) : super(key: key);
  static const String routeName = '/second_sprint';
  @override
  State<SecondSprint> createState() => _SecondSprintState();
}

class _SecondSprintState extends State<SecondSprint> {
  late Size screen;
  late Widget choice = const SideMenuPhone();
  List<TileButtonComponentWidget> listTile = [];
  double initialHeigth = 190;
  @override
  void initState() {
    // TODO: implement initState
    listTile.add(const TileButtonComponentWidget());
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screen.width,
        height: screen.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/background.png',
          ),
          fit: BoxFit.cover,
        )),
        child: Row(
          children: [
            Container(
              color: Colors.white,
              width: screen.width * 0.29,
              child: choice,
            ),
            const SizedBox(
              width: 50,
            ),
            SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          choice = const SideMenuEmail();
                        });
                      },
                      child: const QuestionEmailComponent()),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 300,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            choice = const SideMenuPhone();
                          });
                        },
                        child: const QuestionPhoneComponent(),
                      ),
                      const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        choice = const SideMenuDate();
                      });
                    },
                    child: const QuestionDateComponent(),
                  ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        choice = const SideMenuText();
                      });
                    },
                    child: const QuestionTextComponent(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 150,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            choice = SideMenuButtons(
                              onPressedAdd: () {
                                setState(() {
                                  initialHeigth += 44;
                                  listTile
                                      .add(const TileButtonComponentWidget());
                                });
                              },
                            );
                          });
                        },
                        child: Container(
                          width: 240,
                          height: initialHeigth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: ButtonsComponent(listTile: listTile),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
