import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/sorting_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortingPageAppBar extends PreferredSize {
  SortingPageAppBar(
      {required super.preferredSize, super.child = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButton(

        ),
        // DropdownButton(items: [items], onChanged: onChanged)
        Builder(
          builder: (BuildContext context) {
            return TextButton(
                onPressed: () {
                  context.read<SortingPageCubit>().add(StartSortingEvent());
                },
                child: Text("Sort"));
          },
        ),
        Builder(
          builder: (BuildContext context) {
            return TextButton(
                onPressed: () {
                  context.read<SortingPageCubit>().add(GenerateArrayEvent());
                },
                child: Text("Restart"));
          },
        )
      ],
    );
  }
}
