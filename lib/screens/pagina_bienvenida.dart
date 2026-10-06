import 'package:flutter/material.dart';

import 'menu_principal.dart';

class PaginaBienvenida extends StatelessWidget {
  const PaginaBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADMICLINICA',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF071A2B),
        foregroundColor: Colors.cyanAccent,
        elevation: 0,
        leading: const Icon(Icons.business, color: Colors.cyanAccent),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.check_circle, color: Colors.greenAccent),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF071A2B), Color(0xFF0A2942), Color(0xFF071522)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.5),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                    gradient: const LinearGradient(
                      colors: [Colors.cyanAccent, Colors.blueAccent],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 85,
                    backgroundColor: Color(0xFF0A1F33),
                    backgroundImage: AssetImage('assets/adminpro.png'),
                  ),
                ),

                const SizedBox(height: 35),

                const Text(
                  '¡BIENVENIDO!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'CLINICA SAS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.cyanAccent.withOpacity(0.3),
                    ),
                  ),
                  child: const Text(
                    'AdminPro es una herramienta de administración '
                    'empresarial de fácil uso, diseñada para facilitar '
                    'la organización de las actividades de una empresa. '
                    'Permite gestionar la agenda de citas, llevar un '
                    'control de las personas atendidas durante el día '
                    'y registrar la información de los empleados, '
                    'centralizando estas funciones en una aplicación '
                    'sencilla y organizada.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.white70,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.cyanAccent,
                      size: 25,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Agenda de citas',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people, color: Colors.cyanAccent, size: 25),
                    SizedBox(width: 8),
                    Text(
                      'Registro de empleados',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bar_chart, color: Colors.cyanAccent, size: 25),
                    SizedBox(width: 8),
                    Text(
                      'Control de personas atendidas',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'SISTEMA ACTIVO',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuPrincipal()),
          );
        },
        backgroundColor: Colors.cyanAccent,
        child: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF071522),
          size: 30,
        ),
      ),
    );
  }
}
