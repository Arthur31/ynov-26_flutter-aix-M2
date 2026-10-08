import 'package:aix_1/TP-3_membership_form/membership_form_screen./membership_form_screen.dart';

class MembershipFormValidators {
  // MembershipFormValidators._();

  static final RegExp _emailRegex = RegExp(
    r'^[\w.!#$%&’*+/=?^_`{|}~-]+@[\w-]+(?:\.[\w-]+)+$',
  );

  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez saisir votre nom complet';
    }
    return null;
  }

  static String? email(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Veuillez saisir votre email';
    }
    if (!_emailRegex.hasMatch(email)) {
      return 'Veuillez saisir un email valide';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez saisir un mot de passe';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit contenir 6 caractères';
    }
    return null;
  }

  static String? passwordConfirmation(String? confirmation, String password) {
    if (confirmation == null || confirmation.isEmpty) {
      return 'Veuillez confirmer le mot de passe';
    }
    if (confirmation != password) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  static String? subscription(Subscription? value) {
    if (value == null) {
      return 'Veuillez choisir un forfait';
    }
    return null;
  }

  static String? birthDate(DateTime? value) {
    if (value == null) {
      return 'Veuillez sélectionner votre date de naissance';
    }

    return null;
  }

  static String? acceptedTerms(bool? value) {
    if (value != true) {
      return 'Vous devez accepter les conditions';
    }
    return null;
  }
}
