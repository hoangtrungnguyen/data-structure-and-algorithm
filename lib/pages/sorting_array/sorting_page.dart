import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/sorting_page_cubit.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/widgets/app_bar.dart'
    show SortingPageAppBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SortingPage extends StatelessWidget {
  const SortingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SortingPageCubit>(
      create: (context) => SortingPageCubit(),
      child: Scaffold(
          appBar: SortingPageAppBar(
            preferredSize: Size(double.infinity, 56),
          ),
          body: Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  BlocBuilder<SortingPageCubit, SortingPageState>(
                    builder: (context, state) {
                      return state.whenOrNull(initial: () {
                            return Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<SortingPageCubit>()
                                        .add(GenerateArrayEvent());
                                  },
                                  child: Text("Generate Array")),
                            );
                          }, loading: () {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }, loaded: (_, __) {
                            return SizedBox();
                          }) ??
                          Center(child: Text("error"));
                    },
                  ),
                  AlgorithmWidget()
                ],
              );
            },
          )),
    );
  }
}

class AlgorithmWidget extends StatelessWidget {
  const AlgorithmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return SizedBox();
    return BlocSelector<SortingPageCubit, SortingPageState, AlgorithmState?>(
        selector: (state) {
      return state.whenOrNull(loaded: (status, algorithmState) {
        return algorithmState;
      });
    }, builder: (context, data) {
      if (data == null) return SizedBox();
      final length = data.length;
      final maxValue = data.maxValue;
      final array = data.array;
      return LayoutBuilder(
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
                final color = _setSelectedColor(index, data.selectedIndex, data.selectedIndex2);
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
      );
    });
  }

  Color _setSelectedColor(int index, int selectedIndex, int selectedIndex2) {
    if(index == selectedIndex ){
      return Colors.red;
    } else if(index == selectedIndex2){
      return Colors.orangeAccent;
    } else {
      return Colors.blue;
    }
  }
}
