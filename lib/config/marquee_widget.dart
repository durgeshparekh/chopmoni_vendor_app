import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

class MarqueeWidgetController extends ChangeNotifier {
  bool _started;

  /// Check if scrolling has started
  bool get started => _started;

  MarqueeWidgetController({bool autoStart = false}) : _started = autoStart;

  void startScroll() {
    _started = true;
    notifyListeners();
  }

  void stopScroll() {
    _started = false;
    notifyListeners();
  }
}

class MarqueeWidget extends StatefulWidget {
  final Widget child;
  final Axis scrollDirection;
  final int speed;
  final Duration returnDuration;
  final Duration startPauseDuration;
  final Duration? endPauseDuration;
  final MarqueeWidgetController? controller;
  final Curve primaryCurve;
  final Curve returnCurve;

  const MarqueeWidget({
    Key? key,
    required this.child,
    this.scrollDirection = Axis.horizontal,
    this.returnDuration = const Duration(milliseconds: 800),
    this.startPauseDuration = const Duration(milliseconds: 500),
    this.endPauseDuration = const Duration(seconds: 2),
    this.speed = 20,
    this.controller,
    this.primaryCurve = Curves.linear,
    this.returnCurve = Curves.easeOut,
  })  : assert(speed > 0, "Speed has to be greater than zero"),
        super(key: key);

  @override
  State<MarqueeWidget> createState() => _MarqueeWidgetState();
}

class _MarqueeWidgetState extends State<MarqueeWidget> {
  late final ScrollController _scrollController;
  late final MarqueeWidgetController _autoScrollController;

  double get maxScrollExtent => _scrollController.position.maxScrollExtent;
  Duration get scrollDuration => Duration(
        milliseconds: ((maxScrollExtent / widget.speed) * 1000).toInt(),
      );

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 50.0);
    _autoScrollController =
        widget.controller ?? MarqueeWidgetController(autoStart: true);

    if (_autoScrollController.started) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());
    } else {
      _autoScrollController.addListener(_scroll);
    }

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadingEdgeScrollView.fromSingleChildScrollView(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: widget.scrollDirection,
        controller: _scrollController,
        child: widget.child,
      ),
    );
  }

  void _scroll() async {
    if (_scrollController.hasClients &&
        _scrollController.offset > 0 &&
        !_autoScrollController.started) {
      _scrollController.jumpTo(0);
      return;
    }
    while (_scrollController.hasClients && _autoScrollController.started) {
      // Run futures in succession
      await Future.delayed(widget.startPauseDuration).then((_) {
        if (_scrollController.hasClients &&
            _autoScrollController.started &&
            _scrollController.offset == 0) {
          return _scrollController.animateTo(
            maxScrollExtent,
            duration: scrollDuration,
            curve: widget.primaryCurve,
          );
        }
      }).then((_) {
        if (_scrollController.hasClients &&
            _autoScrollController.started &&
            _scrollController.offset == maxScrollExtent) {
          return Future.delayed(
            widget.endPauseDuration ?? widget.startPauseDuration,
          );
        }
      }).then((_) {
        if (_scrollController.hasClients &&
            _scrollController.offset == maxScrollExtent) {
          return _scrollController.animateTo(
            0.0,
            duration: widget.returnDuration,
            curve: widget.returnCurve,
          );
        }
      });
    }
  }
}
