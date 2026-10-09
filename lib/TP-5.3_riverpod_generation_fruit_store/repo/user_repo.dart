import 'dart:async';
import 'dart:convert';

import 'package:aix_1/TP-5.3_riverpod_generation_fruit_store/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  Future<User> fetchUser(String id) async {
    return User(id: 0, name: "John doe", email: "j.doe@company.com");
  }

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
}
