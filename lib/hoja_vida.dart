import 'package:flutter/material.dart';
import 'proyectos.dart'; // Importa la pantalla donde se verán los proyectos

// Pantalla principal de la hoja de vida
class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR SUPERIOR DE LA HOJA DE VIDA
      appBar: AppBar(
        title: const Text("Mi Hoja de Vida"),
        backgroundColor: const Color.fromARGB(255, 11, 141, 6), // Color verde para identidad visual
        foregroundColor: Colors.white, // Textos e íconos del AppBar en blanco

        // Acción para cerrar sesión y volver al login
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context); // Regresa a la pantalla anterior (login)
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            label: const Text(
              "Salir",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),

      // FONDO DE LA PANTALLA COMPLETA
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo_login.png"), // Imagen para dar estilo
            fit: BoxFit.cover, // Se ajusta al tamaño total de la vista
          ),
        ),

        // CONTENIDO PRINCIPAL DE LA HOJA DE VIDA
        child: Column(
          children: [
            // FOTO DE PERFIL
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/perfil.png"),
            ),

            // ---------------------- INFORMACIÓN PERSONAL ----------------------
            Card(
              color: const Color.fromARGB(255, 177, 180, 7),
              child: ListTile(
                title: const Text("Información Personal"),
                leading: const Icon(Icons.person),
                trailing: const Icon(Icons.arrow_forward_ios),

                // Abre un modal inferior con los detalles
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Permite expandir completo
                    builder: (r) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text("Información Personal"),
                          backgroundColor: const Color.fromARGB(255, 177, 180, 7),
                        ),

                        // Detalles personales en un ListView para scroll
                        body: ListView(
                          padding: const EdgeInsets.all(16),
                          children: const [
                            Text("Nombre completo:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("David Alejandro Gomez Gonzalias\n"),

                            Text("Cargo deseado:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Desarrollador de software y analista de datos.\n"),

                            Text("Número de teléfono:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("3156922393\n"),

                            Text("Correo electrónico:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("alejandrogomez2002@gmail.com\n"),

                            Text("Ubicación:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Bogotá - Colombia\n"),

                            Text("LinkedIn:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("https://www.linkedin.com/in/david-alejandro-gomez-gonzalias-170404311/"),

                            Text("GitHub:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("https://github.com/davicho3112"),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // ---------------------- PERFIL PROFESIONAL ----------------------
            Card(
              color: const Color.fromARGB(255, 177, 180, 7),
              child: ListTile(
                title: const Text("Perfil Profesional"),
                leading: const Icon(Icons.person_outline),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (r) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text("Perfil Profesional"),
                          backgroundColor: const Color.fromARGB(255, 177, 180, 7),
                          foregroundColor: Colors.white,
                        ),
                        body: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Estudiante avanzado (3.5 años) de Ingeniería de Sistemas con enfoque en "
                            "desarrollo de software escalable, buenas prácticas (clean code) y exploración "
                            "de fundamentos de IA. Busco oportunidad como practicante o junior en Java, "
                            "Node.js y Angular.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // ---------------------- HABILIDADES ----------------------
            Card(
              color: const Color.fromARGB(255, 177, 180, 7),
              child: ListTile(
                title: const Text("Habilidades"),
                leading: const Icon(Icons.star),
                trailing: const Icon(Icons.arrow_forward_ios),

                // Abre un modal que lista habilidades técnicas y blandas
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (r) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text("Habilidades"),
                          backgroundColor: const Color.fromARGB(255, 177, 180, 7),
                          foregroundColor: Colors.white,
                        ),
                        body: ListView(
                          padding: const EdgeInsets.all(16),
                          children: const [
                            Text("Habilidades Técnicas",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text("• Bases de datos: MySQL"),
                            Text("• Desarrollo web: Node.js, Express, Angular, React"),
                            Text("• Java (POO y estructuras de datos)"),
                            Text("• Git y GitHub"),
                            Text("• Scrum (metodología ágil)\n"),

                            Text("Habilidades Blandas",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text("• Resolución de problemas"),
                            Text("• Trabajo en equipo"),
                            Text("• Comunicación efectiva"),
                            Text("• Inglés A2 intermedio\n"),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // ---------------------- EXPERIENCIA LABORAL ----------------------
            Card(
              color: const Color.fromARGB(255, 177, 180, 7),
              child: ListTile(
                title: const Text("Experiencia Laboral"),
                leading: const Icon(Icons.work),
                trailing: const Icon(Icons.arrow_forward_ios),

                // Modal de experiencia laboral
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (r) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text("Experiencia Laboral"),
                          backgroundColor: const Color.fromARGB(255, 177, 180, 7),
                          foregroundColor: Colors.white,
                        ),
                        body: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Sin experiencia laboral formal",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // ---------------------- EDUCACIÓN ----------------------
            Card(
              color: const Color.fromARGB(255, 177, 180, 7),
              child: ListTile(
                title: const Text("Educación"),
                leading: const Icon(Icons.school),
                trailing: const Icon(Icons.arrow_forward_ios),

                // Modal dinámico con estudios desde la lista "estudios"
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (r) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text("Educación"),
                          backgroundColor: const Color.fromARGB(255, 177, 180, 7),
                          foregroundColor: Colors.white,
                        ),

                        // ListView.builder permite crear ítems según la cantidad de datos
                        body: ListView.builder(
                          itemCount: estudios.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                estudios[index]["titulo"],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                estudios[index]["descripcion"],
                                style: const TextStyle(fontStyle: FontStyle.italic),
                              ),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    estudios[index]["Sitio/Plataforma"],
                                    style: const TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Text(estudios[index]["fecha"]),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTÓN FLOTANTE PARA IR A LA SECCIÓN DE PROYECTOS
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 227, 240, 226),
        tooltip: "Mirar proyectos", // Mensaje al dejar el cursor encima
        child: const Icon(Icons.folder),

        // Navegación a la página de proyectos
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProyectosPage()),
          );
        },
      ),
    );
  }
}

// ---------------------- LISTA DE ESTUDIOS (USADA EN EDUCACIÓN) ----------------------
// Se usa un Map para almacenar título, fecha, plataforma y descripción.
// Permite alimentar dinámicamente el ListView.builder.
final List<Map<String, dynamic>> estudios = [
  { 
    "titulo": "Bachillerato tecnico",
    "fecha": "16/01/2016 - 03/12/2021",
    "Sitio/Plataforma": "Institución Educativa Almirante Padilla",
    "descripcion": "Completo el bachillerato graduándome como técnico en sistemas"
  },
  {
    "titulo": "Soporte técnico para el mantenimiento de cómputo",
    "fecha": "28/07/2021",
    "Sitio/Plataforma": "SENA",
    "descripcion": "Aprendí metodologías para mantenimiento de equipos de cómputo"
  },
  {
    "titulo": "Introduccion a la base de datos",
    "fecha": "17/06/2025",
    "Sitio/Plataforma": "COURSERA",
    "descripcion": "Fundamentos básicos sobre bases de datos"
  },
  {
    "titulo": "Conceptualizacion de C++",
    "fecha": "22/04/2022",
    "Sitio/Plataforma": "SENA",
    "descripcion": "Conceptos básicos de C++ y lógica de programación"
  },
  {
    "titulo": "Creación de aplicaciones JavaScript con Node.js",
    "fecha": "28/11/2024",
    "Sitio/Plataforma": "MICROSOFT",
    "descripcion": "Desarrollo backend básico con Node.js"
  },
  {
    "titulo": "Java estructura de datos y POO",
    "fecha": "30/04/2024",
    "Sitio/Plataforma": "COURSERA",
    "descripcion": "Dominio de POO y estructuras de datos en Java"
  },
  {
    "titulo": "Introducción a Angular",
    "fecha": "30/05/2025",
    "Sitio/Plataforma": "COURSERA",
    "descripcion": "Uso práctico del framework Angular paso a paso"
  },
  {
    "titulo": "Introducción a React",
    "fecha": "25/04/2025",
    "Sitio/Plataforma": "COURSERA",
    "descripcion": "Fundamentos de React y componentes reutilizables"
  },
];
