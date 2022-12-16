import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiscal/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCardWidget extends StatefulWidget {
  MyCardWidget({
    super.key,
    required this.index,
    required this.title,
    required this.date,
    required this.note,
    required this.status,
    required this.phone,
    required this.name,
    required this.lastName,
    required this.testigos,
    required this.pruebas,
  });

  int index;
  String title;
  String date;
  String note;
  String status;
  String phone;
  String name;
  String lastName;
  String testigos;
  String pruebas;

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget>
    with AutomaticKeepAliveClientMixin {
  final fireStore = FirebaseFirestore.instance;

  bool isActive = false;

  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  bool tap = false;
  bool body = false;

  Future getData() async {
    final res = await fireStore.collection("solicitudes").get();

    return res.docs;
  }

  @override
  Widget build(BuildContext context) {
    final main = Provider.of<MainProvider>(context);
    return GestureDetector(
      onTap: () {
        tap = !tap;
        if (body) {
          body = false;
        } else {
          Future.delayed(const Duration(milliseconds: 300), () {
            body = true;
            setState(() {});
          });
        }
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.all(tap ? 40 : 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: tap ? Colors.black.withOpacity(0.25) : Colors.transparent,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 60,
              padding: EdgeInsets.all(tap ? 5 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${widget.index}',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      height: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      height: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      height: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: snapshot.data[widget.index]
                                        .data()['status']
                                        .toString()
                                        .trim() ==
                                    '0'
                                ? const Color.fromARGB(255, 88, 88, 88)
                                : snapshot.data[widget.index]
                                            .data()['status']
                                            .toString()
                                            .trim() ==
                                        '1'
                                    ? const Color.fromARGB(255, 53, 160, 57)
                                        .withOpacity(0.99)
                                    : const Color.fromARGB(255, 226, 48, 35)
                                        .withOpacity(0.99),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            snapshot.data[widget.index]
                                        .data()['status']
                                        .toString()
                                        .trim() ==
                                    '0'
                                ? 'En Espera'
                                : snapshot.data[widget.index]
                                            .data()['status']
                                            .toString()
                                            .trim() ==
                                        '1'
                                    ? 'Aceptada'
                                    : 'Denegada',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.86),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            ' - ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      height: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                        ),
                        child: const Text('Aceptar'),
                        onPressed: () {
                          fireStore
                              .collection('solicitudes')
                              .doc(widget.index.toString())
                              .update({'status': 1});
                          Future.delayed(const Duration(seconds: 3), () {});
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Negar'),
                        onPressed: () {
                          fireStore
                              .collection('solicitudes')
                              .doc(widget.index.toString())
                              .update({'status': 2});
                          Future.delayed(const Duration(seconds: 3), () {});
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: body
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '- Situation -',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            widget.note,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              const Text(
                                'Full name: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${widget.name} ${widget.lastName}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                'Phone: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.phone,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                'Pruebas: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.pruebas,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                'Testigos: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.testigos,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Divider(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 80,
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18.5,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.05),
                                labelText: 'Add note to this solicitud',
                                labelStyle: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 40,
                              ),
                              backgroundColor: Colors.green,
                            ),
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            onPressed: () {
                              fireStore
                                  .collection('solicitudes')
                                  .doc(widget.index.toString())
                                  .update({'status': 2});
                              Future.delayed(const Duration(seconds: 3), () {});
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
