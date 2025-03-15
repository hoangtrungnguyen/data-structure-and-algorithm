import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/sorting_page_cubit.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/algorithm_view_bloc.dart';

class AlgorithmWidget extends StatelessWidget {
  const AlgorithmWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingPageBloc, SortingPageState>(
      // selector: (SortingPageState state) {
      //   return state.whenOrNull(loaded: (type, _) => type);
      // },
      builder: (BuildContext context, SortingPageState state) {
        return state.whenOrNull(loaded: (type, array) {
              return BlocProvider<AlgorithmViewBloc>(
                create: (_) {
                  return AlgorithmViewBloc(type, array);
                },
                child: AlgorithmContentWidget(),
              );
            }) ??
            Text("Generate array for me");
      },
    );
  }
}

class AlgorithmContentWidget extends StatelessWidget {
  const AlgorithmContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AlgorithmViewBloc, AlgorithmViewState, AlgorithmState>(
        selector: (state) {
      return state.algorithmState;
    }, builder: (context, data) {
      // return SizedBox();
      final length = data.length;
      final maxValue = data.maxValue;
      final array = data.array;
      return Column(
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: () {
                context.read<AlgorithmViewBloc>().add(AlgorithmViewEvent.started());
              }, child: Text("Start sorting"))
            ],
          ),
          Expanded(
            child: LayoutBuilder(
              key: UniqueKey(),
              builder: (BuildContext context, BoxConstraints constraints) {
                final unit = constraints.maxWidth / (length) - 24;
                final heightUnit = (constraints.maxHeight - 32) / maxValue;
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  height: constraints.maxHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: array.mapIndexed((index, value) {
                      final color = _setSelectedColor(
                          index, data.selectedIndex, data.selectedIndex2);
                      return MouseRegion(
                        onHover: (_) {
                          if (unit < 12) {}
                        },
                        child: Container(
                            width: unit,
                            height: heightUnit * value,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            color: color,
                            alignment: Alignment.topCenter,
                            child: Text(
                              '$value',
                              style: TextStyle(fontSize: 32),
                            )),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      );
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
}
