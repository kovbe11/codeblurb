part of '../code_editing_screen.dart';

class _CodeEditingScreenWrapper extends StatelessWidget {
  const _CodeEditingScreenWrapper({required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                      mainAxisSize: MainAxisSize.max, children: children),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
