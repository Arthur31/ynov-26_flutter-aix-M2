import 'package:flutter/material.dart';

import 'membership_form_validators.dart';
import '../models/user.dart';

enum Subscription {
  standard("Standard"),
  premium("Premium"),
  gold("Gold");

  const Subscription(this.diplayName);

  final String diplayName;
}

class MembershipFormScreen extends StatefulWidget {
  const MembershipFormScreen({super.key, this.onUserSubmitted});

  final ValueChanged<User>? onUserSubmitted;

  @override
  State<MembershipFormScreen> createState() => _MembershipFormScreenState();
}

class _MembershipFormScreenState extends State<MembershipFormScreen> {
  // static const List<String> _subscriptions = ['Standard', 'Premium', 'Gold'];

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();
  final _subscriptionController = TextEditingController();

  // String? _selectedSubscription;
  Subscription? _selectedSubscription;
  DateTime? _birthDate;
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    _subscriptionController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  Future<void> _selectBirthDate(FormFieldState<DateTime> field) async {
    final now = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: 'Sélectionnez votre date de naissance',
    );

    if (selectedDate == null) {
      return;
    }

    setState(() {
      _birthDate = selectedDate;
    });
    field.didChange(selectedDate);
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _fullNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmationController.clear();
    _subscriptionController.clear();

    setState(() {
      _selectedSubscription = null;
      _birthDate = null;
      _acceptedTerms = false;
    });

    FocusScope.of(context).unfocus();
  }

  void _submitForm() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final user = User(
      fullName: _fullNameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      subscription: _selectedSubscription!,
      birthDate: _birthDate!,
      acceptedTerms: _acceptedTerms,
    );

    widget.onUserSubmitted?.call(user);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('Adhésion enregistrée pour ${user.fullName}')),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adhésion SportClub'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Créer votre profil',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      key: const Key('fullNameField'),
                      controller: _fullNameController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Nom complet',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: MembershipFormValidators.fullName,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      key: const Key('emailField'),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: MembershipFormValidators.email,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      key: const Key('passwordField'),
                      controller: _passwordController,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Mot de passe',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      validator: MembershipFormValidators.password,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      key: const Key('confirmationField'),
                      controller: _confirmationController,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'Confirmation du mot de passe',
                        prefixIcon: Icon(Icons.lock_reset),
                      ),
                      validator: (value) =>
                          MembershipFormValidators.passwordConfirmation(
                            value,
                            _passwordController.text,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _buildSubscriptionField(),
                    const SizedBox(height: 16),
                    _buildBirthDateField(),
                    const SizedBox(height: 8),
                    _buildTermsField(),
                    const SizedBox(height: 24),
                    Wrap(
                      alignment: WrapAlignment.end,
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        OutlinedButton.icon(
                          key: const Key('resetButton'),
                          onPressed: _resetForm,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Réinitialiser'),
                        ),
                        FilledButton.icon(
                          key: const Key('submitButton'),
                          onPressed: _submitForm,
                          icon: const Icon(Icons.check),
                          label: const Text('Valider l’adhésion'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionField() {
    return FormField<Subscription>(
      key: const Key('subscriptionField'),
      initialValue: null,
      validator: MembershipFormValidators.subscription,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu<Subscription>(
              key: const Key('subscriptionMenu'),
              controller: _subscriptionController,
              expandedInsets: EdgeInsets.zero,
              label: const Text('Forfait'),
              leadingIcon: const Icon(Icons.card_membership),
              dropdownMenuEntries: Subscription.values
                  .map(
                    (subscription) => DropdownMenuEntry(
                      value: subscription,
                      label: subscription.diplayName,
                    ),
                  )
                  .toList(),
              onSelected: (value) {
                setState(() {
                  _selectedSubscription = value;
                });
                field.didChange(value);
              },
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  field.errorText!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildBirthDateField() {
    return FormField<DateTime>(
      key: const Key('birthDateField'),
      initialValue: _birthDate,
      validator: MembershipFormValidators.birthDate,
      builder: (field) {
        return InkWell(
          key: const Key('birthDateButton'),
          borderRadius: BorderRadius.circular(4),
          onTap: () => _selectBirthDate(field),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Date de naissance',
              prefixIcon: const Icon(Icons.cake_outlined),
              suffixIcon: const Icon(Icons.calendar_month),
              errorText: field.errorText,
            ),
            child: Text(
              _birthDate == null
                  ? 'Sélectionner une date'
                  : _formatDate(_birthDate!),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTermsField() {
    return FormField<bool>(
      key: const Key('termsField'),
      initialValue: _acceptedTerms,
      validator: MembershipFormValidators.acceptedTerms,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              key: const Key('termsCheckbox'),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('J’accepte les conditions générales'),
              value: _acceptedTerms,
              onChanged: (value) {
                final isAccepted = value ?? false;
                setState(() {
                  _acceptedTerms = isAccepted;
                });
                field.didChange(isAccepted);
              },
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  field.errorText!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
