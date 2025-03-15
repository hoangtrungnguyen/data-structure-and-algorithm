import 'package:collection/collection.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/sorting_page_cubit.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/widgets/app_bar.dart'
    show SortingPageAppBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'widgets/algorithm/algorithm_view.dart';

class SortingPage extends StatelessWidget {
  const SortingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SortingPageBloc>(
      create: (context) => SortingPageBloc(),
      child: Scaffold(
          appBar: SortingPageAppBar(
            preferredSize: Size(double.infinity, 56),
          ),
          body: Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  BlocBuilder<SortingPageBloc, SortingPageState>(
                    builder: (context, state) {
                      return state.whenOrNull(initial: () {
                            return Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<SortingPageBloc>()
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
                  Builder(
                    builder: (context) {
                      return AlgorithmWidget();
                    }
                  )
                ],
              );
            },
          )),
    );
  }
}