import 'package:data_structure_and_algorithm/20_graphs/graphs.dart';
import 'package:data_structure_and_algorithm/queue/queue.dart';

void main() {
  final graph = AdjacencyList<String>();
  final A = graph.createVertex('A');
  final B = graph.createVertex('B');
  final C = graph.createVertex('C');
  final D = graph.createVertex('D');
  final E = graph.createVertex('E');
  final F = graph.createVertex('F');
  final G = graph.createVertex('G');
  final H = graph.createVertex('H');

  graph.addEdge(A, B);
  graph.addEdge(A, C);
  graph.addEdge(A, D);

  graph.addEdge(B, E);
  graph.addEdge(B, A);

  graph.addEdge(C, A);
  graph.addEdge(C, F);
  graph.addEdge(C, G);

  graph.addEdge(D, A);

  graph.addEdge(E, H);
  graph.addEdge(E, F);
  graph.addEdge(E, B);

  graph.addEdge(F, E);
  graph.addEdge(F, G);
  graph.addEdge(F, C);

  graph.addEdge(G, F);
  graph.addEdge(G, C);

  graph.addEdge(H, E);

  final foundA = graph.breadthFirstSearch(A);
  print('foundA: $foundA');
  print(foundA);
  // print(foundA?.map((e) => e.toString()));
  // print(foundA?.map((e) {
  //   final edges = graph.edges(e);
  //   print(edges);
  // }));

  final foundA2  = graph.breadthFirstSearch(A);
  print('foundA2: $foundA2');
  print(foundA == foundA2);


  final foundE = graph.breadthFirstSearch(E);
  print('foundE: $foundE');

  print('-----');
  final foundG = graph.breadthFirstSearch(G);
  // print(foundG?.map((e) => e.toString()));
  // print(foundG?.map((e) {
  //   final edges = graph.edges(e);
  //   print(edges);
  // }));
}

// FROM THE BOOK
extension BreadthFirstSearch<E extends Comparable<dynamic>> on Graph<E> {
  List<Vertex<E>> breadthFirstSearch(Vertex<E> source) {
    final queue = QueueStack<Vertex<E>>();
    Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    //1
    queue.enqueue(source);
    enqueued.add(source);

    while (true) {
      //2
      final vertex = queue.dequeue();
      print('after dequeue: $queue');
      if (vertex == null) break;
      //3
      visited.add(vertex);
      //4
      final neighborEdges = edges(vertex);

      for (final edge in neighborEdges) {
        //5
        if (!enqueued.contains(edge.destination)) {
          queue.enqueue(edge.destination);
          print('after enqueue: $queue');
          enqueued.add(edge.destination);
        }
      }
    }

    return visited;
  }
}

extension RecursiveBreadthFirstSearch<E extends Comparable<dynamic>>
    on Graph<E> {
  List<Vertex<E>>? recursiveBreadthFirstSearch(Vertex<E> source) {
    // _e

    final queue = QueueStack<Vertex<E>>();
    Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    _bsf(
      queue,
      enqueued,
      visited,
    );
    return visited;
  }

  void _bsf(
    QueueStack<Vertex<E>> queue,
    Set<Vertex<E>> enqueued,
    List<Vertex<E>> visited,
  ) {
    final vertex = queue.dequeue();
    if (vertex == null) return;

    visited.add(vertex);
    //4
    final neighborEdges = edges(vertex);

    for (final edge in neighborEdges) {
      //5
      if (!enqueued.contains(edge.destination)) {
        queue.enqueue(edge.destination);
        enqueued.add(edge.destination);
      }
    }
    _bsf(queue, enqueued, visited);
  }
}

// SELF MADE
extension BreadthFirstSearchSelfImplement<E extends Comparable<dynamic>>
    on Graph<E> {
  List<Vertex<E>>? breadthFirstSearchSelfImpl(E value) {
    if (vertices.isEmpty) return null;

    final result = <Vertex<E>>{};
    final queue = QueueStack<Vertex<E>>();
    final visited = <Vertex<E>>{};

    queue.enqueue(vertices.first);

    // this queue.peek is bad because is loop through the list of data
    while (queue.peek != null) {
      final source = queue.dequeue()!;
      visited.add(source);
      if (source.data == value) {
        result.add(source);
      }
      final edgesForThis = edges(source);
      final vertices = edgesForThis.map((e) => e.destination);
      for (final v in vertices) {
        if (!visited.contains(v)) {
          queue.enqueue(v);
        }
      }
    }

    return result.toList();
  }
}

// CHALLENGE 3 - Disconnected Graph
extension DisconnectedGraph<E extends Comparable<dynamic>> on Graph<E>{
  bool isConnected(){
    if(vertices.isEmpty) return true;
    final visited = breadthFirstSearch(vertices.first);
    for(final vertex in vertices){
      if(!visited.contains(vertex)){
       return false;
      }
    }
    return true;
  }

  bool isConnectedSelfMade(){
    if(vertices.isEmpty) return true;
    final visited = breadthFirstSearch(vertices.first);
    return visited.length == vertices.length;
  }


}