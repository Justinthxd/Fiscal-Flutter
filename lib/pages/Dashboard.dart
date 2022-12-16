import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiscal/provider/provider.dart';
import 'package:fiscal/widgets/AppBar.dart';
import 'package:fiscal/widgets/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final fireStore = FirebaseFirestore.instance;

  Future getData() async {
    final res = await fireStore.collection("solicitudes").get();
    return res.docs;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final main = Provider.of<MainProvider>(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                'assets/login-bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                MyAppBar(),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(
                            vertical: 60,
                            horizontal: size.width * 0.08,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Justin',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              Divider(),
                              Text(
                                'Admin - justinthxd@gmail.com',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(
                            vertical: 60,
                            horizontal: size.width * 0.05,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FutureBuilder(
                                future: getData(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      'Solicitudes: ${snapshot.data.length}',
                                      style: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                      'Solicitudes: 0',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    );
                                  }
                                },
                              ),
                              const Divider(),
                              const Text(
                                'Gobierno Nacional - RD',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 900,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                  ),
                  child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          separatorBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 35,
                              ),
                              child: Divider(
                                color: Colors.black.withOpacity(0.03),
                                thickness: 3,
                              ),
                            );
                          },
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return MyCardWidget(
                              index: i,
                              title: '${snapshot.data[i].data()['name']}',
                              date: '${snapshot.data[i].data()['date']}',
                              note: '${snapshot.data[i].data()['notes']}',
                              status: '${snapshot.data[i].data()['status']}',
                              phone: '${snapshot.data[i].data()['phone']}',
                              name: '${snapshot.data[i].data()['name']}',
                              lastName:
                                  '${snapshot.data[i].data()['lastName']}',
                              testigos:
                                  '${snapshot.data[i].data()['testigos']}',
                              pruebas: '${snapshot.data[i].data()['pruebas']}',
                            );
                          },
                        );
                        // return DataTable(
                        //   columns: const [
                        //     DataColumn(
                        //       label: Text(
                        //         'No.',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ),
                        //     DataColumn(
                        //       label: Text(
                        //         'Nombre',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ),
                        //     DataColumn(
                        //       label: Text(
                        //         'Tipo',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ),
                        //     DataColumn(
                        //       label: Text(
                        //         'Fecha de solcitud',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ),
                        //     DataColumn(
                        //       label: Text(
                        //         'Estado',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ),
                        //     DataColumn(
                        //       label: Text(
                        //         '',
                        //       ),
                        //     ),
                        //   ],
                        //   rows: [
                        //     for (int i = 0; i < snapshot.data.length; i++)
                        //       DataRow(
                        //         cells: [
                        //           DataCell(
                        //             Text('#${i + 1}'),
                        //           ),
                        //           DataCell(
                        //             Text('${snapshot.data[i].data()['name']}'),
                        //           ),
                        //           const DataCell(
                        //             Text('Online'),
                        //           ),
                        //           DataCell(
                        //             Text('${snapshot.data[i].data()['date']}'),
                        //           ),
                        //           DataCell(
                        //             snapshot.data[i]
                        //                         .data()['status']
                        //                         .toString()
                        //                         .trim() ==
                        //                     '0'
                        //                 ? const Text('En Espera')
                        //                 : snapshot.data[i]
                        //                             .data()['status']
                        //                             .toString()
                        //                             .trim() ==
                        //                         '1'
                        //                     ? const Text('Aceptada')
                        //                     : const Text('Denegada'),
                        //           ),
                        //           DataCell(
                        //             Row(
                        //               children: [
                        //                 ElevatedButton(
                        //                   child: const Text('Aceptar'),
                        //                   onPressed: () {
                        //                     fireStore
                        //                         .collection('solicitudes')
                        //                         .doc(i.toString())
                        //                         .update({'status': 1});
                        //                     Future.delayed(
                        //                         const Duration(seconds: 3),
                        //                         () {});
                        //                     setState(() {});
                        //                   },
                        //                 ),
                        //                 const SizedBox(width: 10),
                        //                 ElevatedButton(
                        //                   style: ElevatedButton.styleFrom(
                        //                     backgroundColor: Colors.red,
                        //                   ),
                        //                   child: const Text('Negar'),
                        //                   onPressed: () {
                        //                     fireStore
                        //                         .collection('solicitudes')
                        //                         .doc(i.toString())
                        //                         .update({'status': 2});
                        //                     Future.delayed(
                        //                         const Duration(seconds: 3),
                        //                         () {});
                        //                     setState(() {});
                        //                   },
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //   ],
                        // );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    children: const [
                      Spacer(),
                      Icon(
                        Icons.copyright_rounded,
                        color: Colors.white24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Procuraduria Fiscal R.D.',
                        style: TextStyle(
                          color: Colors.white24,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.facebook_rounded,
                        size: 25,
                        color: Colors.white24,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.apple_rounded,
                        size: 30,
                        color: Colors.white24,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.android_rounded,
                        size: 30,
                        color: Colors.white24,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
