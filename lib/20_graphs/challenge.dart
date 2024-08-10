import 'graphs.dart';

void main(){
  final graph = AdjacencyList<String>();
  final megan = graph.createVertex('Megan');
  final sandra = graph.createVertex('Sandra');
  final pablo = graph.createVertex('Pablo');
  final edith = graph.createVertex('Edith');
  final vicki = graph.createVertex('Vicki');
  final ray = graph.createVertex('Ray');
  final luke = graph.createVertex('Luke');
  final manda = graph.createVertex('Manda');


  graph.addEdge(megan, sandra);
  graph.addEdge(megan, pablo);
 graph.addEdge(megan, edith);
 graph.addEdge(pablo, ray);
 graph.addEdge(pablo, luke);
 graph.addEdge(edith, manda);
 graph.addEdge(edith, vicki);
 graph.addEdge(manda, pablo);
 graph.addEdge(manda, megan);

 print(graph);

 final meganFriends = Set.of(graph.edges(megan).map((e) => e.destination.data));
 final pabloFriends = Set.of(graph.edges(pablo).map((e) => e.destination.data));

 print(meganFriends);
 print(pabloFriends);
 print(pabloFriends.intersection(meganFriends));



}

// Which mutual friend do Pablo and Megan share
// Sandra