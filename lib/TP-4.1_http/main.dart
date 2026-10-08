import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // N'oubliez pas d'ajouter http dans pubspec.yaml

void main() {
  runApp(const DirectoryApp());
}

// 1. LE MODÈLE
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
  // Le factory pour désérialiser le JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], email: json['email']);
  }
}

// 2. LA LOGIQUE RÉSEAU
Future<List<User>> fetchUsers() async {
  await Future.delayed(const Duration(seconds: 2));

  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  try {
    // Ajout du timeout de 5 secondes ici
    final response = await http.get(url).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('HTTP Erreur : ${response.statusCode}');
    }
  } on TimeoutException catch (_) {
    // On capture spécifiquement le Timeout pour un message sur mesure
    throw Exception(
      'Le délai d\'attente est dépassé. Vérifiez votre connexion internet.',
    );
  } catch (e) {
    throw Exception('Erreur de connexion : $e');
  }
}

// 3. L'INTERFACE UTILISATEUR
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Annuaire Inconu"),
          backgroundColor: Colors.blue,
        ),
        body: const UserListScreen(),
      ),
    );
  }
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // On stocke le Future dans le state pour éviter qu'il ne se relance à chaque rebuild de l'UI
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: futureUsers,
      builder: (context, snapshot) {
        // État 1 : Chargement en cours (On n'a ni erreur, ni data)
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // État 2 : Erreur
        else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                SizedBox(
                  height: 200,
                  // width: 50,
                  child: Image.asset("assets/images/oups.png"),
                ),
                Text(
                  "Oups : ${snapshot.error}",
                  style: const TextStyle(color: Colors.red),
                  textAlign: .center,
                ),
                ElevatedButton.icon(
                  onPressed: () => {
                    setState(() {
                      futureUsers = fetchUsers();
                    }),
                  },
                  label: Text("Retry"),
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          );
        }
        // État 3 : Succès (On a de la donnée)
        else if (snapshot.hasData) {
          // Le "!" est safe ici car on a vérifié hasData
          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      user.name[0],
                    ), // Affiche la première lettre du nom
                  ),
                  title: Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(user.email),
                ),
              );
            },
          );
        }

        // Cas par défaut (ne devrait pas arriver)
        return const Center(child: Text("Aucune donnée disponible."));
      },
    );
  }
}
