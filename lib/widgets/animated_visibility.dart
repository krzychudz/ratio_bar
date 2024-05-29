import 'package:flutter/widgets.dart';

class AnimatedVisibility extends StatelessWidget {
  const AnimatedVisibility({
    super.key,
    required this.child,
    required this.isVisible,
  });

  final Widget child;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 150),
      curve: Curves.fastOutSlowIn,
      child: isVisible ? child : const SizedBox.shrink(),
    );
  }
}
