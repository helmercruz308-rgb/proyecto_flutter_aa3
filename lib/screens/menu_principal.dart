import 'package:flutter/material.dart';

import 'pantalla_pacientes.dart';

import 'pantalla_citas.dart';

import 'gestion_empleados.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MENÚ PRINCIPAL',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF071A2B),
        foregroundColor: Colors.cyanAccent,
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
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            const SizedBox(height: 20),

            const Text(
              '¿Qué deseas gestionar?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              color: Colors.white.withOpacity(0.08),
              child: ListTile(
                leading: const Icon(
                  Icons.people,
                  color: Colors.cyanAccent,
                  size: 35,
                ),
                title: const Text(
                  'Pacientes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Registrar y consultar pacientes',
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.cyanAccent,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PantallaPacientes(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            Card(
              color: Colors.white.withOpacity(0.08),
              child: ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                  color: Colors.cyanAccent,
                  size: 35,
                ),
                title: const Text(
                  'Citas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Gestionar agenda de citas',
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.cyanAccent,
                ),
                onTap: () {
                  // ✅ Aquí conectas la nueva pantalla:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PantallaCitas(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            Card(
              color: Colors.white.withOpacity(0.08),
              child: ListTile(
                leading: const Icon(
                  Icons.medical_services,
                  color: Colors.cyanAccent,
                  size: 35,
                ),
                title: const Text(
                  'Empleados',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Gestionar información de empleados',
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.cyanAccent,
                ),

                onTap: () {
                  print('=== CLICK DETECTADO ==='); // Prueba de consola
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GestionEmpleadosScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
