import 'package:flutter/material.dart';

// Página principal que muestra la lista de proyectos.
// Se usa StatelessWidget porque no existe un estado que cambie dinámicamente.
class ProyectosPage extends StatelessWidget {
  const ProyectosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: barra superior que muestra el título de la pantalla.
      appBar: AppBar(
        title: const Text("Mis Proyectos"),
        backgroundColor: const Color.fromARGB(255, 50, 75, 4), 
        foregroundColor: Colors.white, // Asegura contraste del texto e íconos.
      ),
      
      // ListView: permite desplazar verticalmente las tarjetas de proyectos.
      body: ListView(
        padding: const EdgeInsets.all(16), // Espaciado uniforme.
        children: [
          
          // PROYECTO: Fake Store (Angular)
          
          Card(
            color: const Color.fromARGB(255, 173, 212, 127), // Fondo decorativo.
            child: ListTile(
              leading: const Icon(Icons.shopping_cart), // Ícono representativo.
              title: const Text("Fake Store (Angular)"),
              trailing: const Icon(Icons.arrow_forward_ios), // Indica navegación.
              
              // onTap: acción al tocar la tarjeta, abre modal con imágenes.
              onTap: () {
                _openProyectoModal(
                  context,
                  "Fake Store - Angular",
                  [
                    "assets/fake_store/store1.png",
                    "assets/fake_store/store2.png",
                  ],
                );
              },
            ),
          ),

          // PROYECTO: Sitio turístico (React + Node.js)
        
          Card(
            color: const Color.fromARGB(255, 173, 212, 127),
            child: ListTile(
              leading: const Icon(Icons.travel_explore),
              title: const Text("Sitio Turístico (React + Node.js)"),
              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () {
                _openProyectoModal(
                  context,
                  "Sitio Turístico - React + Node.js",
                  [
                    "assets/servicio_turistico/turismo1.png",
                    "assets/servicio_turistico/turismo2.png",
                    "assets/servicio_turistico/turismo3.png",
                  ],
                );
              },
            ),
          ),
         
          // PROYECTO: AgroMarket (React + Node.js)
          Card(
            color: const Color.fromARGB(255, 173, 212, 127),
            child: ListTile(
              leading: const Icon(Icons.agriculture),
              title: const Text("AgroMarket (React + Node.js)"),
              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () {
                _openProyectoModal(
                  context,
                  "AgroMarket - React + Node.js",
                  [
                    "assets/agro_market/agro1.png",
                    "assets/agro_market/agro2.png",
                    "assets/agro_market/agro3.png",
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

 
  /* El Modal inferior permite mostrar imágenes del proyecto.
     Se elige showModalBottomSheet porque permite mostrar
     información adicional sin cambiar de pantalla.
   */
  void _openProyectoModal(BuildContext context, String titulo, List<String> imagenes) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que el modal use más espacio vertical.
      builder: (_) {
        return Scaffold(
          // AppBar dentro del modal para mantener la referencia del proyecto.
          appBar: AppBar(
            title: Text(titulo),
            backgroundColor: const Color.fromARGB(255, 245, 243, 240),
          ),

          // ListView: desplaza verticalmente las imágenes del proyecto.
          body: ListView(
            padding: const EdgeInsets.all(16),
            // map convierte cada ruta de imagen en un widget Image.asset.
            children: imagenes.map((img) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16), // Espaciado entre imágenes.
                child: Image.asset(
                  img,
                  fit: BoxFit.cover, // Ajusta la imagen al ancho disponible.
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
