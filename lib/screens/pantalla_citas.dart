import 'package:flutter/material.dart';

import 'agendar_cita.dart';
import 'citas_programadas.dart';
import 'historial_citas.dart';
import 'gestion_empleados.dart';

class PantallaCitas extends StatelessWidget {
  const PantallaCitas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GESTIÓN DE CITAS',
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
            const SizedBox(height: 10),

            const Text(
              'Agenda médica',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            // Opción 1: Agendar Cita
            Card(
              color: Colors.white.withOpacity(0.08),
              child: ListTile(
                leading: const Icon(
                  Icons.add_task,
                  color: Colors.cyanAccent,
                  size: 35,
                ),
                title: const Text(
                  'Agendar Nueva Cita',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Asignar fecha, hora y especialista',
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.cyanAccent,
                ),
                // ⬇️ REVISA ESTA PARTE:
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AgendarCitaScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // Opción 2: Ver Citas Programadas
            // Opción 2: Ver Citas Programadas
            Card(
              color: Colors.white.withOpacity(0.08),
              child: ListTile(
                leading: const Icon(
                  Icons.event_note,
                  color: Colors.cyanAccent,
                  size: 35,
                ),
                title: const Text(
                  'Citas Programadas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Consultar y cancelar citas pendientes',
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.cyanAccent,
                ),
                // ⬇️ AQUÍ ESTÁ EL onTap QUE DEBES CAMBIAR:
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CitasProgramadasScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // Opción 3: Historial
            Card(
              color: Colors.white.withOpacity(0.08),
              child: ListTile(
                leading: const Icon(
                  Icons.history,
                  color: Colors.cyanAccent,
                  size: 35,
                ),
                title: const Text(
                  'Historial de Citas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Ver citas completadas y canceladas',
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
                      builder: (context) => const HistorialCitasScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),
            Card(
              color: Colors.white.withOpacity(0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.cyanAccent.withOpacity(0.2)),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                leading: const Icon(
                  Icons.badge, // 👈 Ícono de carné / empleado
                  color: Colors.cyanAccent,
                  size: 35,
                ),
                title: const Text(
                  'Gestión de Empleados',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Consultar y registrar personal médico',
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
