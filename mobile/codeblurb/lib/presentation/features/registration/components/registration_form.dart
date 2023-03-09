part of '../registration_screen.dart';

class _RegistrationForm extends ConsumerWidget {
  const _RegistrationForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registrationNotifierProvider.notifier);

    ref.listen<AsyncValue<void>>(
      registrationNotifierProvider,
      (_, state) => state
        ..bindLoader(context)
        ..whenData(
          (data) {
            if (!state.isRefreshing) {
              if (state.hasValue) {
                context.router.replace(const HomeRoute());
              }
            }
          },
        ),
    );
    final l10n = S.of(context);

    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 40),
          Text(
            l10n.enterCredentials,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 24),
          InputField(
            key: const Key('input_username'),
            controller: notifier.usernameController,
            label: l10n.username,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.none,
            validator: Validators.required,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.username],
          ),
          const SizedBox(height: 24),
          InputField(
            key: const Key('input_password'),
            controller: notifier.passwordController,
            isSecureField: true,
            label: l10n.password,
            validator: Validators.password,
            autofillHints: const [AutofillHints.password],
            onSubmit: () => notifier.register(context),
          ),
          const SizedBox(height: 24),
          InputField(
            key: const Key('confirm_password'),
            controller: notifier.confirmPasswordController,
            isSecureField: true,
            label: l10n.confirmPassword,
            validator: (String? value) {
              log(value ?? '');
              log(notifier.passwordController.text);
              return Validators.confirmPassword(
                  notifier.passwordController.text)(value);
            },
            autofillHints: const [AutofillHints.password],
            onSubmit: () => notifier.register(context),
          ),
          const SizedBox(height: 60),
          PrimaryButton(
            title: l10n.register,
            onTap: () => notifier.register(context),
          ),
          const SizedBox(height: 24),
          SecondaryButton(
            title: l10n.back,
            onTap: context.router.pop,
          ),
        ],
      ),
    );
  }
}
