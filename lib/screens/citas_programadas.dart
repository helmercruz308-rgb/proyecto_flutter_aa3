import 'package:flutter/material.dart';

class CitasProgramadasScreen extends StatefulWidget {
  const CitasProgramadasScreen({super.key});

  @override
  State<CitasProgramadasScreen> createState() => _CitasProgramadasScreenState();
}

class _CitasProgramadasScreenState extends State<CitasProgramadasScreen> {
  // Lista de citas de prueba
  final List<Map<String, String>> _citas = [
    {
      'paciente': 'Carlos Mendoza',
      'medico': 'Dr. Alejandro Silva',
      'especialidad': 'Medicina General',
      'fecha': '12/10/2026',
      'hora': '09:00 AM',
      'estado': 'Confirmada',
    },
    {
      'paciente': 'María Rodríguez',
      'medico': 'Dra. Sofia López',
      'especialidad': 'Pediatría',
      'fecha': '12/10/2026',
      'hora': '10:30 AM',
      'estado': 'Pendiente',
    },
    {
      'paciente': 'Juan Pablo Gómez',
      'medico': 'Dr. Roberto Ruiz',
      'especialidad': 'Cardiología',
      'fecha': '13/10/2026',
      'hora': '02:15 PM',
      'estado': 'Confirmada',
    },
    {
      'paciente': 'Ana Lucía Torres',
      'medico': 'Dra. Elena Ramos',
      'especialidad': 'Odontología',
      'fecha': '14/10/2026',
      'hora': '11:00 AM',
      'estado': 'Pendiente',
    },
  ];

  String _filtroTexto = '';

  @override
  Widget build(BuildContext context) {
    // Filtrado por nombre de paciente o médico
    final citasFiltradas = _citas.where((cita) {
      final paciente = cita['paciente']!.toLowerCase();
      final medico = cita['medico']!.toLowerCase();
      final busqueda = _filtroTexto.toLowerCase();
      return paciente.contains(busqueda) || medico.contains(busqueda);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CITAS PROGRAMADAS',
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Campo de Búsqueda
              TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    _filtroTexto = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Buscar por paciente o médico...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.cyanAccent,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.08),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.cyanAccent.withOpacity(0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.cyanAccent,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Lista de Citas
              Expanded(
                child: citasFiltradas.isEmpty
                    ? const Center(
                        child: Text(
                          'No se encontraron citas',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: citasFiltradas.length,
                        itemBuilder: (context, index) {
                          final cita = citasFiltradas[index];
                          final esConfirmada = cita['estado'] == 'Confirmada';

                          return Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            color: Colors.white.withOpacity(0.08),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: Colors.cyanAccent.withOpacity(0.2),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Encabezado: Paciente y Estado
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          cita['paciente']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: esConfirmada
                                              ? Colors.teal.withOpacity(0.3)
                                              : Colors.orangeAccent.withOpacity(
                                                  0.3,
                                                ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: esConfirmada
                                                ? Colors.tealAccent
                                                : Colors.orangeAccent,
                                          ),
                                        ),
                                        child: Text(
                                          cita['estado']!,
                                          style: TextStyle(
                                            color: esConfirmada
                                                ? Colors.tealAccent
                                                : Colors.orangeAccent,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const Divider(
                                    color: Colors.white24,
                                    height: 20,
                                  ),

                                  // Información del Médico
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.medical_services,
                                        color: Colors.cyanAccent,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${cita['medico']} (${cita['especialidad']})',
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  // Fecha y Hora
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        color: Colors.cyanAccent,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        cita['fecha']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      const Icon(
                                        Icons.access_time,
                                        color: Colors.cyanAccent,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        cita['hora']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
