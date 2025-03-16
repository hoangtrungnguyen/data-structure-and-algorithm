import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/sorting_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/algorithm_view_bloc.dart';
import 'widget/algorithm_view_row.dart';

class AlgorithmWidget extends StatefulWidget {
  AlgorithmWidget({
    super.key,
  });

  @override
  State<AlgorithmWidget> createState() => _AlgorithmWidgetState();
}

class _AlgorithmWidgetState extends State<AlgorithmWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingPageBloc, SortingPageState>(
      builder: (BuildContext context, SortingPageState state) {
        return state.whenOrNull(loaded: (type, array) {
              return BlocProvider<AlgorithmViewBloc>(
                key: UniqueKey(),
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

class AlgorithmContentWidget extends StatefulWidget {
  const AlgorithmContentWidget({
    super.key,
  });

  @override
  State<AlgorithmContentWidget> createState() => _AlgorithmContentWidgetState();
}

class _AlgorithmContentWidgetState extends State<AlgorithmContentWidget>
    with TickerProviderStateMixin {
  bool isInIt = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  context
                      .read<AlgorithmViewBloc>()
                      .add(AlgorithmViewEvent.started());
                },
                child: Text("Start sorting"))
          ],
        ),
        Expanded(child: AlgorithmViewRow()),
        // Expanded(child: AnimatedRow())
      ],
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
