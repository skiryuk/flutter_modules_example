import 'package:flutter/cupertino.dart';
import 'package:uikit/uikit.dart';

class ModulePageScaffold extends StatelessWidget {
  const ModulePageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SafeArea(
        bottom: false,
        child: UiModuleScaffold(
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'This is Module Page Scaffold',
                        style: TextStyle(color: CupertinoColors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          onBack: Navigator.of(context).pop,
        ),
      ),
    );
  }
}
