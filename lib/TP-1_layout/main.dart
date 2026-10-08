import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileCardPage> createState() => _ProfileCardPageState();
}

class _ProfileCardPageState extends State<ProfileCardPage> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    // Centralisation des styles pour éviter les répétitions et alléger le build
    final textTheme = Theme.of(context).textTheme;
    final nameStyle = textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final jobStyle = textTheme.bodyMedium?.copyWith(
      color: const Color(0xFFA2A2A2),
    );

    return Scaffold(
      backgroundColor:
          Colors.grey[100], // Léger fond pour faire ressortir l'ombre blanche
      body: Center(
        child: Container(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              // Utiliser un CircleAvatar natif plutot qu'on Container complexe
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/images/Arthur MARTY profil.jpg",
                ),
              ),
              Text("Arthur Marty", style: nameStyle),
              Text("Développeur Mobile", style: jobStyle),
              const Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  TagWidget(tag: "Flutter"),
                  TagWidget(tag: "Swift"),
                  TagWidget(tag: "Rust"),
                ],
              ),
              const SizedBox(
                height: 4,
              ), // Léger espace avant le bouton d'action
              GestureDetector(
                onTap: () => setState(() {
                  isFollow = !isFollow;
                }),
                child: TagWidget(
                  tag: isFollow ? "Suivis" : "Suivre",
                  isAction: true,
                  isFollow: isFollow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String tag;
  final bool isAction;
  final bool isFollow;

  const TagWidget({
    super.key,
    required this.tag,
    this.isAction = false,
    this.isFollow = false,
  });

  @override
  Widget build(BuildContext context) {
    // Gestion dynamique de la couleur selon le rôle (Tag vs Bouton Suivre)
    final btnColor = isFollow ? Colors.green : Colors.blue;
    final primaryColor = isAction ? btnColor : Colors.blue.withAlpha(20);
    final textColor = isAction ? Colors.white : Colors.blue;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
