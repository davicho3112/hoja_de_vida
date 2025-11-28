import 'package:flutter/material.dart';
import 'hoja_vida.dart'; // Importa la pantalla Base a donde se navegará tras el login correcto

// Punto de entrada principal de la aplicación
void main() {
  runApp(const LoginApp()); // runApp carga la app completa con el widget raíz
}

// Widget principal de configuración general de la app
class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "mi primer login", 
      theme: ThemeData(primarySwatch: Colors.green), // Tema principal de la app
      home: const LoginPage(), // Primera pantalla a mostrar
      debugShowCheckedModeBanner: false, // Esconde el banner de debug
    );
  }
}

// La pantalla de login requiere actualizar su interfaz, por eso es StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para obtener el texto escrito por el usuario y contraseña
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _message = ""; // Mensaje de error mostrado cuando falla el login

  // Credenciales válidas quemadas (solo para ejemplo)
  final String _validUsername = "usuario123";
  final String _validPassword = "clave456";

  // Función que valida las credenciales ingresadas
  void _login() {
    final String username = _usernameController.text.trim(); // trim() elimina espacios
    final String password = _passwordController.text.trim();

    // Validación simple comparando cadenas
    if (username == _validUsername && password == _validPassword) {
      setState(() {
        _message = ""; // Limpia error si estaba presente
      });

      // Navegación a la pantalla Base() al iniciar sesión correctamente
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Base()),
      );
    } else {
      // Si falla el login, se actualiza la pantalla con un mensaje de error
      setState(() {
        _message = "Error: Usuario o Contraseña Incorrecta";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con título
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 117, 38),
        elevation: 6, // Sombra para profundidad
        shadowColor: Colors.black45,
        title: const Text(
          "Acceder a la Hoja de Vida",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.white,
          ),
        ),
      ),

      // Cuerpo con fondo personalizado
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo_login.png"), // Imagen de fondo
            fit: BoxFit.cover, // Cubre toda la pantalla
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            // Evita overflow cuando el teclado aparece
            padding: const EdgeInsets.all(32.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                // Campo para usuario
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Usuario",
                    labelStyle: const TextStyle(color: Colors.black87),
                    filled: true, 
                    fillColor: Colors.white.withOpacity(0.8), // Fondo claro
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none, // Sin borde inicial
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.green, width: 2.0),
                    ),
                    prefixIcon: const Icon(Icons.person, color: Colors.green),
                  ),
                ),

                const SizedBox(height: 20),

                // Campo para contraseña
                TextField(
                  controller: _passwordController,
                  obscureText: true, // Oculta los caracteres
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    labelStyle: const TextStyle(color: Colors.black87),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.green, width: 2.0),
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.green),
                  ),
                ),

                const SizedBox(height: 30),

                // Botón de inicio de sesión
                ElevatedButton(
                  onPressed: _login, // Función que valida credenciales
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.green.shade700, // Botón verde oscuro
                    foregroundColor: Colors.white, // Texto blanco
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Inicio de Sesion"),
                ),

                const SizedBox(height: 30),

                // Muestra el mensaje de error en rojo si existe
                if (_message.isNotEmpty)
                  Text(
                    _message,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
