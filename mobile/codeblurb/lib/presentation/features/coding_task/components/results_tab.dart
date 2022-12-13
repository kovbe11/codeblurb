import 'package:codeblurb/core/app_ui_constants.dart';
import 'package:codeblurb/presentation/features/coding_task/components/test_case_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

const _dummyCode = '''
// Your First Program

class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!"); 
    }
}
''';

class ResultsTab extends StatelessWidget {
  const ResultsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: mediaQuery.size.height / 3,
            child: SyntaxView(
              code: _dummyCode,
              syntax: Syntax.DART,
              syntaxTheme: SyntaxTheme.vscodeDark(),
              fontSize: 14.0,
              withZoom: false,
              withLinesCount: true,
              expanded: true,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Tests overall",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () =>
                          DefaultTabController.of(context)?.animateTo(1),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.orange.shade700.withOpacity(0.3),
                            borderRadius: AppUIConstants.borderCircular30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Text('Try again',
                                  style: TextStyle(
                                    color: Colors.orangeAccent.shade100,
                                  )),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.refresh,
                                color: Colors.orangeAccent.shade100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.red.shade700.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.redAccent.shade100,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const TestCaseItem(
                  testName: "Correct Syntax",
                  isSuccessful: true,
                  hasDetails: false,
                ),
                // const SizedBox(height: 12),
                // const TestCaseItem(
                //   testName: "Test Case #1",
                //   isSuccessful: true,
                // ),
                const SizedBox(height: 12),
                const TestCaseItem(
                  testName: "Test Case #1",
                  isSuccessful: false,
                ),
                SizedBox(height: mediaQuery.padding.bottom)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
