import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Container(
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
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/Solicitud');
                        },
                        child: const Text(
                          'Solicitud',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/SignUp');
                        },
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
                    color: Colors.white.withOpacity(0.99),
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'No. Solicitud',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Tipo de solicitud',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Tipo de prueba',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Fecha de solcitud',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Estado',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          '',
                        ),
                      ),
                    ],
                    rows: [
                      for (int i = 0; i < 5; i++)
                        DataRow(
                          cells: [
                            const DataCell(
                              Text('#4039'),
                            ),
                            DataCell(
                              Text('Tipo $i'),
                            ),
                            const DataCell(
                              Text('Manual'),
                            ),
                            DataCell(
                              Text(
                                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
                            ),
                            const DataCell(
                              Text('Aceptado'),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  ElevatedButton(
                                    child: const Text('Aceptar'),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: const Text('Negar'),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
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
