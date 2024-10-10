import 'package:flutter/cupertino.dart';
import 'package:uikit/uikit.dart';

class BackPageScaffold extends StatelessWidget {
  const BackPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: UiBackPageScaffold(
            body: const Column(
              children: [
                Text(
                  'This is Back Page Scaffold',
                  style: TextStyle(color: CupertinoColors.black),
                )
              ],
            ),
            onBack: Navigator.of(context).pop,
          ),
        ),
      ),
    );
  }
}
