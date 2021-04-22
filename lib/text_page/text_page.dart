import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transaction/text_page/text_page_controller_provider.dart';

class TextPage extends StatelessWidget {
  Widget _buildLaunchTextInputScreenWidget() {
    return HookBuilder(builder: (context) {
      final controller = useProvider(textPageControllerProvider.notifier);
      return TextButton(
          onPressed: () {
            controller.onTapLaunchTextScreen();
          },
          child: const Text("テキスト入力画面の起動"));
    });
  }

  Widget _buildTextWidget() {
    return HookBuilder(builder: (context) {
      final monitoringText =
          useProvider(textPageControllerProvider.select((value) => value.text));
      return Text(monitoringText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [_buildLaunchTextInputScreenWidget(), _buildTextWidget()],
          ),
        ),
      ),
    );
  }
}
