part of '../login_screen.dart';

class _LoginForm extends ConsumerWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginNotifierProvider.notifier);

    ref.listen<AsyncValue<void>>(
      loginNotifierProvider,
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
    WidgetsBinding.instance.addPostFrameCallback((_) => notifier.init());

    final l10n = S.of(context);
    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ImageCard(
              image: AssetImage(Assets.codeblurbLogo.path),
              height: 200,
            ),
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
            onTap: () => context.router.replace(const HomeRoute()),
          ),
          const SizedBox(height: 24),
          SecondaryButton(
            title: l10n.createAccount,
            onTap: () => context.router.push(const RegistrationRoute()),
          ),
        ],
      ),
    );
  }
}
