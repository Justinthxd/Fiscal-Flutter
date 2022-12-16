import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiscal/provider/provider.dart';
import 'package:fiscal/widgets/AppBar.dart';
import 'package:fiscal/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Solicitud extends StatefulWidget {
  Solicitud({Key? key}) : super(key: key);

  @override
  State<Solicitud> createState() => _SolicitudState();
}

class _SolicitudState extends State<Solicitud> {
  String groupPruebas = '';
  String groupTestigos = '';

  bool groupBool = false;

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
                'assets/cita-bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                MyAppBar(),
                Container(
                  // height: 1500,
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
                            child: GestureDetector(
                              onTap: () {
                                main.setOption = 0;
                                setState(() {});
                              },
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
                                  border: Border.all(
                                    width: 2,
                                    color: main.getOption == 0
                                        ? Colors.blue
                                        : Colors.transparent,
                                  ),
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
                          ),
                          SizedBox(width: size.width * 0.05),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                main.setOption = 1;
                                setState(() {});
                              },
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
                                  border: Border.all(
                                    width: 2,
                                    color: main.getOption == 1
                                        ? Colors.blue
                                        : Colors.transparent,
                                  ),
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
                        margin: const EdgeInsets.symmetric(horizontal: 0),
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
                        margin: const EdgeInsets.symmetric(horizontal: 0),
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
                        margin: const EdgeInsets.symmetric(horizontal: 0),
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
                        margin: const EdgeInsets.symmetric(horizontal: 0),
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
                              margin: const EdgeInsets.symmetric(horizontal: 0),
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
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0),
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
                      const Text(
                        'Tienes pruebas?',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Radio(
                            value: 'tengo pruebas',
                            activeColor: Colors.black,
                            groupValue: groupPruebas,
                            onChanged: (value) {
                              groupPruebas = value!;
                              main.setPruebas = value;
                              setState(() {});
                            },
                          ),
                          const Text(
                            'Si, Tengo pruebas',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Radio(
                            value: 'no tengo pruebas',
                            activeColor: Colors.black,
                            groupValue: groupPruebas,
                            onChanged: (value) {
                              groupPruebas = value!;
                              main.setPruebas = value;
                              setState(() {});
                            },
                          ),
                          const Text(
                            'No, No tengo pruebas',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        child: TextField(
                          controller: main.getControllers[6],
                          textAlign: TextAlign.center,
                          maxLines: 10,
                          style: const TextStyle(
                            fontSize: 18.5,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            labelText: 'Escribe las pruebas que posee. . .',
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
                      const SizedBox(height: 30),
                      const Text(
                        'Hay testigos?',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Radio(
                            value: 'tengo testigos',
                            activeColor: Colors.black,
                            groupValue: groupTestigos,
                            onChanged: (value) {
                              groupTestigos = value!;
                              main.setTestigos = value;
                              setState(() {});
                            },
                          ),
                          const Text(
                            'Si, Tengo testigos',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Radio(
                            value: 'no tengo testigos',
                            activeColor: Colors.black,
                            groupValue: groupTestigos,
                            onChanged: (value) {
                              groupTestigos = value!;
                              main.setTestigos = value;
                              setState(() {});
                            },
                          ),
                          const Text(
                            'No, No tengo testigos',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: main.getControllers[7],
                                style: const TextStyle(
                                  fontSize: 18.5,
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
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: main.getControllers[8],
                                style: const TextStyle(
                                  fontSize: 18.5,
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
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: main.getControllers[9],
                                style: const TextStyle(
                                  fontSize: 18.5,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black.withOpacity(0.1),
                                  labelText: 'Telefono',
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Que relacion tiene con el tetsigo? Comience a escribir la relacion y seleccione las correcta.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        child: TextField(
                          controller: main.getControllers[10],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 18.5,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            labelText: 'Relacion con la persona',
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
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        child: TextField(
                          controller: main.getControllers[11],
                          textAlign: TextAlign.center,
                          maxLines: 10,
                          style: const TextStyle(
                            fontSize: 18.5,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            labelText: 'Que fue lo que sucedio?',
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
                            'Enviar',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () async {
                            final aux = await getData();

                            final numberAux = main.getNumber;

                            main.setNumber = numberAux + 1;

                            fireStore
                                .collection('solicitudes')
                                .doc((aux.length).toString())
                                .set({
                              'option': main.getOption,
                              'name': main.controllers[0].text,
                              'lastName': main.controllers[1].text,
                              'phone': main.controllers[2].text,
                              'notes': main.controllers[3].text,
                              'date': main.controllers[4].text,
                              'time': main.controllers[5].text,
                              'pruebas': main.getPruebas,
                              'testigos': main.getTestigos,
                              'notes2': main.controllers[6].text,
                              'nameTestigo': main.controllers[7].text,
                              'lastNameTestigo': main.controllers[8].text,
                              'phoneTestigo': main.controllers[9].text,
                              'relationship': main.controllers[10].text,
                              'notes3': main.controllers[11].text,
                              'status': '0',
                            }).then((value) {
                              alertAccountValidated(
                                  context, 'Was sent successfully');
                            });
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
