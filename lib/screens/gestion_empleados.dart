import 'package:flutter/material.dart';

class GestionEmpleadosScreen extends StatefulWidget {
  const GestionEmpleadosScreen({super.key});

  @override
  State<GestionEmpleadosScreen> createState() => _GestionEmpleadosScreenState();
}

class _GestionEmpleadosScreenState extends State<GestionEmpleadosScreen> {
  // Lista inicial de empleados de prueba
  final List<Map<String, String>> _empleados = [
    {
      'nombre': 'Dr. Alejandro Silva',
      'cargo': 'Médico General',
      'departamento': 'Consulta Externa',
      'telefono': '+57 310 123 4567',
      'correo': 'asilva@clinica.com',
      'estado': 'Activo',
    },
    {
      'nombre': 'Dra. Sofía López',
      'cargo': 'Pediatra',
      'departamento': 'Pediatría',
      'telefono': '+57 315 987 6543',
      'correo': 'slopez@clinica.com',
      'estado': 'Activo',
    },
    {
      'nombre': 'Dr. Roberto Ruiz',
      'cargo': 'Cardiólogo',
      'departamento': 'Cardiología',
      'telefono': '+57 300 456 7890',
      'correo': 'rruiz@clinica.com',
      'estado': 'En Licencia',
    },
    {
      'nombre': 'Enf. Laura Gómez',
      'cargo': 'Jefe de Enfermería',
      'departamento': 'Urgencias',
      'telefono': '+57 312 333 4455',
      'correo': 'lgomez@clinica.com',
      'estado': 'Activo',
    },
  ];

  String _filtroTexto = '';

  // Controladores para el formulario de nuevo empleado
  final _nombreController = TextEditingController();
  final _cargoController = TextEditingController();
  final _deptoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _correoController = TextEditingController();

  void _abrirFormularioNuevoEmpleado() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF0A2942),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 25,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 25,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'REGISTRAR NUEVO EMPLEADO',
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              _crearCampoTexto(
                _nombreController,
                'Nombre completo',
                Icons.person,
              ),
              const SizedBox(height: 12),
              _crearCampoTexto(
                _cargoController,
                'Cargo / Especialidad',
                Icons.badge,
              ),
              const SizedBox(height: 12),
              _crearCampoTexto(
                _deptoController,
                'Departamento',
                Icons.business,
              ),
              const SizedBox(height: 12),
              _crearCampoTexto(
                _telefonoController,
                'Teléfono',
                Icons.phone,
                tipoTeclado: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              _crearCampoTexto(
                _correoController,
                'Correo electrónico',
                Icons.email,
                tipoTeclado: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save, color: Colors.black),
                  label: const Text(
                    'GUARDAR EMPLEADO',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_nombreController.text.isEmpty ||
                        _cargoController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Por favor completa los campos principales',
                          ),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                      return;
                    }

                    setState(() {
                      _empleados.add({
                        'nombre': _nombreController.text,
                        'cargo': _cargoController.text,
                        'departamento': _deptoController.text.isEmpty
                            ? 'General'
                            : _deptoController.text,
                        'telefono': _telefonoController.text,
                        'correo': _correoController.text,
                        'estado': 'Activo',
                      });
                    });

                    _nombreController.clear();
                    _cargoController.clear();
                    _deptoController.clear();
                    _telefonoController.clear();
                    _correoController.clear();

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('¡Empleado registrado exitosamente!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _crearCampoTexto(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType tipoTeclado = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: tipoTeclado,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.cyanAccent),
        filled: true,
        fillColor: Colors.white.withOpacity(0.08),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.cyanAccent.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.cyanAccent, width: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final empleadosFiltrados = _empleados.where((emp) {
      final nombre = emp['nombre']!.toLowerCase();
      final cargo = emp['cargo']!.toLowerCase();
      final busqueda = _filtroTexto.toLowerCase();
      return nombre.contains(busqueda) || cargo.contains(busqueda);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GESTIÓN DE EMPLEADOS',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF071A2B),
        foregroundColor: Colors.cyanAccent,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirFormularioNuevoEmpleado,
        backgroundColor: Colors.cyanAccent,
        icon: const Icon(Icons.add, color: Colors.black),
        label: const Text(
          'Nuevo Empleado',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
              // Buscador de Empleados
              TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    _filtroTexto = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Buscar por nombre o cargo...',
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

              // Lista de Empleados
              Expanded(
                child: empleadosFiltrados.isEmpty
                    ? const Center(
                        child: Text(
                          'No se encontraron empleados',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: empleadosFiltrados.length,
                        itemBuilder: (context, index) {
                          final emp = empleadosFiltrados[index];
                          final esActivo = emp['estado'] == 'Activo';

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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          emp['nombre']!,
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
                                          color: esActivo
                                              ? Colors.green.withOpacity(0.2)
                                              : Colors.orange.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: esActivo
                                                ? Colors.greenAccent
                                                : Colors.orangeAccent,
                                          ),
                                        ),
                                        child: Text(
                                          emp['estado']!,
                                          style: TextStyle(
                                            color: esActivo
                                                ? Colors.greenAccent
                                                : Colors.orangeAccent,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${emp['cargo']} — ${emp['departamento']}',
                                    style: const TextStyle(
                                      color: Colors.cyanAccent,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.white24,
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        color: Colors.white70,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        emp['telefono']!,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.email,
                                        color: Colors.white70,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        emp['correo']!,
                                        style: const TextStyle(
                                          color: Colors.white70,
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
