import 'package:flutter/material.dart';

class SwappingAnimation extends StatefulWidget {
  @override
  _SwappingAnimationState createState() => _SwappingAnimationState();
}

class _SwappingAnimationState extends State<SwappingAnimation>
    with SingleTickerProviderStateMixin {
  List<int> _items = [1, 2, 3, 4, 5];
  int? _swapIndex1;
  int? _swapIndex2;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300), // Shorter duration for quicker animation
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _swapItems();
        _animationController.reset();
        setState(() {
          _swapIndex1 = null;
          _swapIndex2 = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _swapItems() {
    if (_swapIndex1 != null && _swapIndex2 != null) {
      final temp = _items[_swapIndex1!];
      _items[_swapIndex1!] = _items[_swapIndex2!];
      _items[_swapIndex2!] = temp;
    }
  }

  void _triggerSwap(int index1, int index2) {
    if (index1 >= 0 &&
        index1 < _items.length &&
        index2 >= 0 &&
        index2 < _items.length &&
        index1 != index2) {
      setState(() {
        _swapIndex1 = index1;
        _swapIndex2 = index2;
      });
      _animationController.forward();
    }
  }

  Widget _buildItem(int index) {
    final item = _items[index];
    final isSwapping = _swapIndex1 == index || _swapIndex2 == index;

    double offset = 0;
    if (_swapIndex1 == index && _swapIndex2 != null) {
      offset = (_swapIndex2! - _swapIndex1!) * 80 * _animation.value; // Increased offset
    } else if (_swapIndex2 == index && _swapIndex1 != null) {
      offset = (_swapIndex1! - _swapIndex2!) * 80 * _animation.value; // Increased offset
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(offset, 0),
          child: GestureDetector(
            onTap: () {
              if (_swapIndex1 == null) {
                setState(() {
                  _swapIndex1 = index;
                });
              } else if (_swapIndex2 == null && _swapIndex1 != index) {
                _triggerSwap(_swapIndex1!, index);
              } else {
                setState(() {
                  _swapIndex1 = index;
                  _swapIndex2 = null;
                });
              }
            },
            child: Container(
              width: 60, // increased width
              height: 60, // increased height
              margin: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSwapping ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [ // Add a shadow for better visibility
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                '$item',
                style: const TextStyle(fontSize: 24), // increased font size
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swapping Animation')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_items.length, _buildItem),
        ),
      ),
    );
  }
}