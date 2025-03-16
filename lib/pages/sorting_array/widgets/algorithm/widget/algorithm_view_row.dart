import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/widgets/algorithm/bloc/algorithm_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlgorithmViewRow extends StatefulWidget {
  const AlgorithmViewRow({super.key});

  @override
  State<AlgorithmViewRow> createState() => _AlgorithmViewRowState();
}

class _AlgorithmViewRowState extends State<AlgorithmViewRow>   {
  bool isInIt = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) async {
      if (mounted) {
        if (!isInIt) {
          context
              .read<AlgorithmViewBloc>()
              .add(AlgorithmViewEvent.initialized());
        }

        isInIt = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlgorithmViewBloc, AlgorithmViewState>(
      builder: (context, state) {
        return LayoutBuilder(
          key: UniqueKey(),
          builder: (BuildContext context, BoxConstraints constraints) {
            final data = state.algorithmState;
            final length = data.length;
            final maxValue = data.maxValue;
            final array = data.array;
            final unit = constraints.maxWidth / (length) - 24;
            final heightUnit = (constraints.maxHeight - 32) / maxValue;

            return Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              height: constraints.maxHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: array.mapIndexed((index, value) {
                  final color = _setSelectedColor(
                      index, data.selectedIndex, data.selectedIndex2);
                  return Column(
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
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
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
}
