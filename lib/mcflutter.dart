import 'package:flutter/material.dart';

class McFlutter extends StatefulWidget {
  const McFlutter({
    Key? key,
  }) : super(key: key);

  @override
  State<McFlutter> createState() => _McFlutterState();
}

class _McFlutterState extends State<McFlutter> {
  List<bool> iconListState = [false, false, false, false];
  Color getColor(int index) {
    Color a;
    iconListState[index - 1] ? a = Colors.indigo : a = Colors.black;
    return a;
  }

  void changeColor(int index) {
    iconListState[index - 1] = !iconListState[index - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mc Flutter'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 1.0, color: Color(0xFF000000)),
                  left: BorderSide(width: 1.0, color: Color(0xFF000000)),
                  right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                  bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
                )),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle_rounded,
                        color: Color(0xFF000000),
                        size: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Flutter McFlutter",
                            style: TextStyle(fontSize: 24),
                          ),
                          Text("Experienced App Developer",
                              style: TextStyle(fontSize: 10))
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("123 Main Street"),
                      Text("(415) 555-0198")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      renderButtonSnack(
                          context,
                          "Únete a un club con otras personas",
                          1,
                          Icons.accessibility_outlined),
                      renderButtonSnack(
                          context,
                          "Cuenta regresiva para el evento: 31 días",
                          2,
                          Icons.alarm),
                      renderButtonSnack(context, "Llama al número 4155550198",
                          3, Icons.phone_android),
                      renderButtonSnack(context, "Llama al celular 3317865113",
                          4, Icons.phone_iphone_rounded),
                    ],
                  )
                ]),
              ),
            ),
            const Expanded(
              flex: 4,
              child: Text(""),
            )
          ],
        ));
  }

  IconButton renderButtonSnack(
      BuildContext context, String text, int index, IconData icon) {
    return IconButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(text)));
          changeColor(index);
          setState(() {});
        },
        iconSize: 30,
        icon: Icon(
          icon,
          color: getColor(index),
        ));
  }
}
