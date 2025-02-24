part of 'sorting_page_cubit.dart';

@immutable
sealed class SortingPageEvent{}

class GenerateArrayEvent extends SortingPageEvent{

}
class StartSortingEvent extends SortingPageEvent{

}