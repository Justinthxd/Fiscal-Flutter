import 'package:fiscal/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Solicitud extends StatefulWidget {
  Solicitud({Key? key}) : super(key: key);

  @override
  State<Solicitud> createState() => _SolicitudState();
}

class _SolicitudState extends State<Solicitud> {
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
                'assets/cita-bg.jpg',
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
                    color: Colors.grey[900],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
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
                        onTap: () {
                          Navigator.pushNamed(context, '/Login');
                        },
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
                          Navigator.pushNamed(context, '/SignUp');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1500,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: 30, horizontal: size.width * 0.25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.99),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 250,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(1),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Icon(
                                    Icons.person_remove_rounded,
                                    size: 100,
                                    color: Colors.red.withOpacity(0.6),
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        main.setOption = 0;
                                        print('Selected');
                                        setState(() {});
                                      },
                                      child: const Text(
                                        'PERSONA AFECTADA',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Expanded(
                            child: Container(
                              height: 250,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(1),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Icon(
                                    Icons.person_add_rounded,
                                    size: 100,
                                    color: Colors.green.withOpacity(0.6),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      main.setOption = 1;
                                      print('Selected');
                                      setState(() {});
                                    },
                                    child: const Text(
                                      'SOY QUIEN DENUNCIA',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
                      const Text(
                        'Quien sufrio el hecho?',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Aqui podras brindar mas datos de la persona afectada, recuerde que los campos marcados con * son obligatorios.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextField(
                          controller: main.getControllers[0],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18.5,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            labelText: 'Nombre',
                            labelStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextField(
                          controller: main.getControllers[1],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18.5,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            labelText: 'Apellido',
                            labelStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextField(
                          controller: main.getControllers[2],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18.5,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            labelText: 'Numero de Telefono',
                            labelStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextField(
                          controller: main.getControllers[3],
                          textAlign: TextAlign.center,
                          maxLines: 10,
                          style: const TextStyle(
                            fontSize: 18.5,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            labelText: 'Aqui puedes dar mas detalles. . .',
                            labelStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Cuando sucedio el hecho que quiere denunciar?',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Los campos marcados con * son obligatorios.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: main.getControllers[4],
                                style: const TextStyle(
                                  fontSize: 18.5,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black.withOpacity(0.1),
                                  labelText: 'Fecha',
                                  labelStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.calendar_month_rounded,
                                      size: 23,
                                      color: Colors.black,
                                    ),
                                    onPressed: () async {
                                      await showDatePicker(
                                        context: context,
                                        initialDate:
                                            DateTime.now(), //get today's date
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101),
                                      ).then((value) {
                                        main.setControllers(
                                          4,
                                          TextEditingController(
                                            text:
                                                ('${value!.day}/${value.month}/${value.year}'),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: main.getControllers[5],
                                style: const TextStyle(
                                  fontSize: 18.5,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black.withOpacity(0.1),
                                  labelText: 'Hora',
                                  labelStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.alarm_rounded,
                                      size: 23,
                                      color: Colors.black,
                                    ),
                                    onPressed: () async {
                                      await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        main.setControllers(
                                          5,
                                          TextEditingController(
                                            text:
                                                ('${value!.hour} : ${value.minute}'),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.withOpacity(0.5),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 25,
                            ),
                          ),
                          child: const Text(
                            'Siguiente',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/Solicitud2');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
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
