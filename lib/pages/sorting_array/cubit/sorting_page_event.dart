part of 'sorting_page_cubit.dart';

@immutable
sealed class SortingPageEvent{}

class GenerateArrayEvent extends SortingPageEvent{

}

class StartSortingEvent extends SortingPageEvent{
  StartSortingEvent();
}

class SelectAlgorithmEvent extends SortingPageEvent{
  final TypeOfAlgorithm type;
  SelectAlgorithmEvent(this.type);
}