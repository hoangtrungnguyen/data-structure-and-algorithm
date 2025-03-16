import 'package:data_structure_and_algorithm/pages/sorting_array/widgets/algorithm/bloc/algorithm_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedRow extends StatefulWidget {
  const AnimatedRow({super.key});

  @override
  State<AnimatedRow> createState() => _AnimatedRowState();
}

class _AnimatedRowState extends State<AnimatedRow>
    with TickerProviderStateMixin {
  bool isInIt = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) async {
      print(' Is callback done?');
      if (mounted) {
        if (!isInIt) {
          context
              .read<AlgorithmViewBloc>()
              .add(AlgorithmViewEvent.initialized(vsync: this));
        }

        isInIt = true;
      }
    });
  }

  Color _setSelectedColor(int index, int selectedIndex, int selectedIndex2) {
    if (index == selectedIndex) {
      return Colors.red;
    } else if (index == selectedIndex2) {
      return Colors.orangeAccent;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return BlocBuilder<AlgorithmViewBloc, AlgorithmViewState>(
          builder: (context, state) {
            final length = state.algorithmState.length;
            final maxValue = 100;
            final unit = constraints.maxWidth / (length) - 24;
            final heightUnit = (constraints.maxHeight - 32) / maxValue;
            final array = state.algorithmState.array;
            final data = state.algorithmState;
            final animations = state.animations;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: array.asMap().entries.map((entry) {
                final index = entry.key;
                final value = entry.value;
                final color = _setSelectedColor(
                    index, data.selectedIndex, data.selectedIndex2);

                final animationValue = animations[index]?.value ??
                    index.toDouble(); // Use animation value or default index

                return AnimatedBuilder(
                  animation:
                      animations[index] ?? const AlwaysStoppedAnimation(0),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset((animationValue - index) * (unit + 24)+ 10, 0),
                      // Translate based on animation
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '$value',
                            style: TextStyle(fontSize: 12),
                          ),
                          Container(
                            width: unit,
                            height: heightUnit * value,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            color: color,
                          ),
                          Text('$index')
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}
