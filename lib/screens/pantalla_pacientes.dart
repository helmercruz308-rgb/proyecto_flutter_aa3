import 'package:flutter/material.dart';

class PantallaPacientes extends StatefulWidget {
  const PantallaPacientes({super.key});

  @override
  State<PantallaPacientes> createState() => _PantallaPacientesState();
}

class _PantallaPacientesState extends State<PantallaPacientes> {
  final List<Map<String, String>> pacientes = [
    {
      'nombre': 'Carlos Pérez',
      'documento': '1234567890',
      'telefono': '3001234567',
      'edad': '25',
    },
    {
      'nombre': 'María Gómez',
      'documento': '9876543210',
      'telefono': '3109876543',
      'edad': '32',
    },
    {
      'nombre': 'Juan Rodríguez',
      'documento': '4567891230',
      'telefono': '3154567890',
      'edad': '41',
    },
  ];

  void agregarPaciente() {
    final nombreController = TextEditingController();
    final documentoController = TextEditingController();
    final telefonoController = TextEditingController();
    final edadController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Registrar paciente',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre y apellido',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: documentoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Documento',
                    prefixIcon: Icon(Icons.badge),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: telefonoController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: edadController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Edad',
                    prefixIcon: Icon(Icons.cake),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),

            ElevatedButton.icon(
              onPressed: () {
                if (nombreController.text.trim().isEmpty ||
                    documentoController.text.trim().isEmpty ||
                    telefonoController.text.trim().isEmpty ||
                    edadController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor completa todos los campos.'),
                    ),
                  );

                  return;
                }

                setState(() {
                  pacientes.add({
                    'nombre': nombreController.text.trim(),
                    'documento': documentoController.text.trim(),
                    'telefono': telefonoController.text.trim(),
                    'edad': edadController.text.trim(),
                  });
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Paciente registrado correctamente.'),
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void eliminarPaciente(int index) {
    final nombre = pacientes[index]['nombre'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar paciente'),
          content: Text('¿Deseas eliminar a $nombre?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  pacientes.removeAt(index);
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Paciente eliminado.')),
                );
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PACIENTES',
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

        child: pacientes.isEmpty
            ? const Center(
                child: Text(
                  'No hay pacientes registrados.',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: pacientes.length,
                itemBuilder: (context, index) {
                  final paciente = pacientes[index];

                  return Card(
                    color: Colors.white.withOpacity(0.08),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.cyanAccent,
                          child: Icon(
                            Icons.person,
                            color: Color(0xFF071522),
                            size: 30,
                          ),
                        ),

                        title: Text(
                          paciente['nombre']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Documento: ${paciente['documento']}',
                                style: const TextStyle(color: Colors.white70),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                'Teléfono: ${paciente['telefono']}',
                                style: const TextStyle(color: Colors.white70),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                'Edad: ${paciente['edad']} años',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),

                        trailing: IconButton(
                          onPressed: () {
                            eliminarPaciente(index);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.redAccent,
                          ),
                          tooltip: 'Eliminar paciente',
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: agregarPaciente,
        backgroundColor: Colors.cyanAccent,
        foregroundColor: const Color(0xFF071522),
        icon: const Icon(Icons.person_add),
        label: const Text(
          'Nuevo paciente',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
