import 'package:flutter/material.dart';

class HistorialCitasScreen extends StatefulWidget {
  const HistorialCitasScreen({super.key});

  @override
  State<HistorialCitasScreen> createState() => _HistorialCitasScreenState();
}

class _HistorialCitasScreenState extends State<HistorialCitasScreen> {
  // Lista de citas en el historial
  final List<Map<String, String>> _historial = [
    {
      'paciente': 'Carlos Mendoza',
      'medico': 'Dr. Alejandro Silva',
      'especialidad': 'Medicina General',
      'fecha': '15/09/2026',
      'hora': '08:30 AM',
      'estado': 'Completada',
      'diagnostico': 'Chequeo general preventivo sin anomalías.',
    },
    {
      'paciente': 'María Rodríguez',
      'medico': 'Dra. Sofia López',
      'especialidad': 'Pediatría',
      'fecha': '10/09/2026',
      'hora': '11:00 AM',
      'estado': 'Cancelada',
      'diagnostico': 'Cita cancelada por el paciente.',
    },
    {
      'paciente': 'Juan Pablo Gómez',
      'medico': 'Dr. Roberto Ruiz',
      'especialidad': 'Cardiología',
      'fecha': '02/09/2026',
      'hora': '04:00 PM',
      'estado': 'Completada',
      'diagnostico': 'Control de hipertensión. Presión estable.',
    },
  ];

  String _filtroTexto = '';

  @override
  Widget build(BuildContext context) {
    final historialFiltrado = _historial.where((cita) {
      final paciente = cita['paciente']!.toLowerCase();
      final medico = cita['medico']!.toLowerCase();
      final busqueda = _filtroTexto.toLowerCase();
      return paciente.contains(busqueda) || medico.contains(busqueda);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HISTORIAL DE CITAS',
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
              // Buscador de historial
              TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    _filtroTexto = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Buscar en historial...',
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

              // Lista del Historial
              Expanded(
                child: historialFiltrado.isEmpty
                    ? const Center(
                        child: Text(
                          'No hay registros en el historial',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: historialFiltrado.length,
                        itemBuilder: (context, index) {
                          final cita = historialFiltrado[index];
                          final esCompletada = cita['estado'] == 'Completada';

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
                                  // Encabezado
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
                                          color: esCompletada
                                              ? Colors.blue.withOpacity(0.3)
                                              : Colors.redAccent.withOpacity(
                                                  0.3,
                                                ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: esCompletada
                                                ? Colors.lightBlueAccent
                                                : Colors.redAccent,
                                          ),
                                        ),
                                        child: Text(
                                          cita['estado']!,
                                          style: TextStyle(
                                            color: esCompletada
                                                ? Colors.lightBlueAccent
                                                : Colors.redAccent,
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

                                  // Médico
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

                                  // Fecha y hora
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
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 12),

                                  // Observaciones / Diagnóstico
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Notas: ${cita['diagnostico']}',
                                      style: const TextStyle(
                                        color: Colors.white60,
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
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
