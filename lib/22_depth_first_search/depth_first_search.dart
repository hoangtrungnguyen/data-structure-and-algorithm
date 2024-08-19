import 'package:data_structure_and_algorithm/20_graphs/graphs.dart';
import 'package:data_structure_and_algorithm/stack/stack.dart';

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

  graph.addEdge(E, H);
  graph.addEdge(E, F);
  graph.addEdge(E, B);

  graph.addEdge(F, E);
  graph.addEdge(F, G);
  graph.addEdge(F, C);

  graph.addEdge(G, F);
  graph.addEdge(G, C);

  graph.addEdge(H, E);

  final foundA = graph.depthFirstSearch(A);
  print('foundA');
  foundA.forEach(print);

  print('--- Recursive ---');
  final foundVertex = graph.recursiveDFS(A);
  print(foundVertex);

  print('--------------');
  print('--- HAS CYCLE ---');
  final graph2 = AdjacencyList<String>();
  final a = graph2.createVertex('A');
  final b = graph2.createVertex('B');
  final c = graph2.createVertex('C');
  final d = graph2.createVertex('D');
  graph2.addEdge(a, b, edgeType: EdgeType.directed);
  graph2.addEdge(a, c, edgeType: EdgeType.directed);
  graph2.addEdge(c, a, edgeType: EdgeType.directed);
  graph2.addEdge(b, c, edgeType: EdgeType.directed);
  graph2.addEdge(c, d, edgeType: EdgeType.directed);
  print(graph2);
  print(graph2.hasCycle(a));
  final foundA_2= graph2.recursiveDFS(a);
  print(foundA_2);
}

extension DepthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> depthFirstSearch(Vertex<E> source) {
    final stack = Stack<Vertex<E>>();
    final pushed = <Vertex<E>>{};
    final visited = <Vertex<E>>[];
    stack.push(source);
    pushed.add(source);
    visited.add(source);

    outerLoop:
    while (stack.isNotEmpty) {
      final vertex = stack.peek;
      final neighbors = edges(vertex);

      for (final edge in neighbors) {
        if (!pushed.contains(edge.destination)) {
          stack.push(edge.destination);
          pushed.add(edge.destination);
          visited.add(edge.destination);
          // 4
          continue outerLoop;
        }
      }
      stack.pop();
    }

    print('pushed: $pushed');
    return visited;
  }
//
// _nextDestination(
//   Stack<Vertex<E>> stack,
//   Vertex<E> destination,
//   Set<Vertex<E>> pushed,
//   List<Vertex<E>> visited,
// ) {
//   if(visited.contains(destination)){
//     return;
//   }
//   final connectedEdges = edges(destination);
//
//
//
//
//   pushed.add(destination);
//   for (int i = 0; i < connectedEdges.length; i++) {
//     final destination = connectedEdges[i].destination;
//     stack.push(destination);
//     _nextDestination(stack, destination, pushed, visited);
//     final visitedNode = stack.pop();
//     if (visitedNode != null) {
//       visited.add(visitedNode);
//     } else {
//       return;
//     }
//   }
// }
}

extension CyclicGraph<E> on Graph<E> {
  bool hasCycle(Vertex<E> source) {
    Set<Vertex<E>> pushed = {};
    return _hasCycle(source, pushed);
  }

  bool _hasCycle(Vertex<E> source, Set<Vertex<E>> pushed) {
    pushed.add(source);
    final neighbors = edges(source);
    for (final edge in neighbors) {
      if (!pushed.contains(edge.destination)) {
        if (_hasCycle(edge.destination, pushed)) {
          return true;
        }
      } else {
        return true;
      }
    }

    pushed.remove(source);

    return false;
  }
}

/// --- CHALLENGE ---

/// CHALLENGE 1
///　A -> B -> C -> D -> F -> H
///  A -> G
///
/// To find path from A to F, we should use Depth First Search
/// To find path from A to G, we should use Breadth First Search
///

/// CHALLENGE 2: recursive depth first search
///

extension RecursiveDFS<E> on Graph<E> {
  List<Vertex<E>> recursiveDFS(Vertex<E> source) {
    final pushed = <Vertex<E>>{};
    final visited = <Vertex<E>>[];

    _dfs(source, pushed, visited);
    print('pushed: $pushed');
    return visited;
  }

  void _dfs(
    Vertex<E> source,
    Set<Vertex<E>> pushed,
    List<Vertex<E>> visited,
  ) {
    if (pushed.contains(source)) {
      return;
    }

    pushed.add(source);
    visited.add(source);

    final neighbors = edges(source);

    for (final edge in neighbors) {
      _dfs(edge.destination, pushed, visited);
    }
  }

}
