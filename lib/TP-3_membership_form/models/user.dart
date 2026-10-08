import 'package:aix_1/TP-3_membership_form/membership_form_screen./membership_form_screen.dart';

class User {
  const User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.subscription,
    required this.birthDate,
    required this.acceptedTerms,
  });

  final String fullName;
  final String email;
  final String password;
  final Subscription subscription;
  final DateTime birthDate;
  final bool acceptedTerms;

  @override
  String toString() {
    return 'User(fullName: $fullName, email: $email, '
        'subscription: $subscription, birthDate: $birthDate, '
        'acceptedTerms: $acceptedTerms)';
  }
}
