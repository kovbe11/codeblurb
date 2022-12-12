part of '../login_screen.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
    required this.l10n,
    required this.notifier,
  }) : super(key: key);

  final S l10n;
  final LoginNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ImageCard(image: AssetImage(Assets.codeblurbLogo.path)),
          ),
          const SizedBox(height: 25),
          Text(
            l10n.welcomeMessage,
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
            onSubmit: () => notifier.login(context),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            title: l10n.signIn,
            onTap: () => notifier.login(context),
          ),
          const SizedBox(height: 24),
          SecondaryButton(
            title: l10n.createAccount,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
