import 'package:data_structure_and_algorithm/pages/sorting_array/cubit/sorting_page_cubit.dart';
import 'package:data_structure_and_algorithm/pages/sorting_array/utils.dart';
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
        BackButton(),
        // DropdownButton(items: [items], onChanged: onChanged
        Builder(
          builder: (BuildContext context) {
            return TextButton(
                onPressed: () {
                  context.read<SortingPageBloc>().add(GenerateArrayEvent());
                },
                child: Text("Restart"));
          },
        ),
        Builder(builder: (context) {
          return BlocSelector<SortingPageBloc, SortingPageState, TypeOfAlgorithm?>(selector: (state){
            return state.whenOrNull(loaded: (type, _,){
              return type;
            });
          }, builder: (context, TypeOfAlgorithm? type){
            if(type == null) return const SizedBox();
            return DropdownButton(
                items: TypeOfAlgorithm.values.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  );
                }).toList(),
                value: type,
                onChanged: (selectedType) {
                  if(selectedType == null) return;
                  context.read<SortingPageBloc>().add(SelectAlgorithmEvent(selectedType));
                });
          });

        })
      ],
    );
  }
}
