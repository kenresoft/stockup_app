import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRenderObject extends RenderBox {
  CustomRenderObject({
    required this.onTap,
  }) : assert(onTap != null);

  late final VoidCallback? onTap;

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerUpEvent) {
      onTap?.call();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Paint background
    final backgroundPaint = Paint()..color = Colors.blue;
    canvas.drawRect(offset & size, backgroundPaint);

    // Paint a circle in the center
    final circlePaint = Paint()..color = Colors.red;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center + offset, 50, circlePaint);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.biggest;
  }
}

class CustomRenderObjectWidget extends LeafRenderObjectWidget {
  const CustomRenderObjectWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderObject(
      onTap: onTap,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as CustomRenderObject).onTap = onTap;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: CustomRenderObjectWidget(
          onTap: () {
            debugPrint('Custom Render Object tapped!');
          },
        ),
      ),
    ),
  ));
}
