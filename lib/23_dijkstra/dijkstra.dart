import 'package:data_structure_and_algorithm/14_priority_queue/priority_queue.dart';
import 'package:data_structure_and_algorithm/20_graphs/graphs.dart';

void main() {
  final graph = AdjacencyList<String>();
  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');
  graph.addEdge(a, b, weight: 8, edgeType: EdgeType.directed);
  graph.addEdge(a, f, weight: 9, edgeType: EdgeType.directed);
  graph.addEdge(a, g, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(g, c, weight: 3, edgeType: EdgeType.directed);
  graph.addEdge(c, b, weight: 3, edgeType: EdgeType.directed);
  graph.addEdge(c, e, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(e, b, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(e, d, weight: 2, edgeType: EdgeType.directed);
  graph.addEdge(b, e, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(b, f, weight: 3, edgeType: EdgeType.directed);
  graph.addEdge(f, a, weight: 2, edgeType: EdgeType.directed);
  graph.addEdge(h, g, weight: 5, edgeType: EdgeType.directed);
  graph.addEdge(h, f, weight: 2, edgeType: EdgeType.directed);

  final dijkstra = Dijkstra(graph);
  final allPaths = dijkstra.shortestPaths(a);
  print(allPaths);
  print('--- shortest path ---');
  final path = dijkstra.shortestPath(a, d);
  print('between: a and d');
  print(path);
}

class Pair<T> implements Comparable<Pair<T>> {
  Pair(this.distance, [this.vertex]);

  double distance;
  Vertex<T>? vertex;

  @override
  int compareTo(Pair<T> other) {
    if (distance == other.distance) return 0;
    if (distance > other.distance) return 1;
    return -1;
  }

  @override
  String toString() => '($distance, $vertex)';
}

class Dijkstra<E> {
  Dijkstra(this.graph);

  final Graph<E> graph;

  Map<Vertex<E>, Pair<E>?> shortestPaths(Vertex<E> source) {
    final queue = PriorityQueue<Pair<E>>(priority: Priority.min);
    final visited = <Vertex<E>>{};
    final paths = <Vertex<E>, Pair<E>?>{};

    for (final vertex in graph.vertices) {
      paths[vertex] = null;
    }
    queue.enqueue(Pair(0, source));
    paths[source] = Pair(0, source);
    visited.add(source);

    while (!queue.isEmpty) {
      final current = queue.dequeue()!;
      final savedDistance = paths[current.vertex]?.distance ?? 0;
      if (current.distance > savedDistance) continue;
      visited.add(current.vertex!);
      final edges = graph.edges(current.vertex!);
      // print('edges: $edges');
      for (final edge in edges) {
        final neighbor = edge.destination;
        if (visited.contains(neighbor)) continue;

        final weight = edge.weight ??
            double.infinity /* infinity means we never go to the distance*/;
        final totalDistance = current.distance + weight;
        final knownDistance = paths[neighbor]?.distance ?? double.infinity;

        if (totalDistance < knownDistance) {
          paths[neighbor] = Pair(totalDistance, current.vertex);
          queue.enqueue(Pair(totalDistance, neighbor));
        }
      }
      // print('''
      // index: ${current.vertex?.index}, data: ${current.vertex?.data}
      // ''');
    }

    return paths;
  }

  List<Vertex<E>> shortestPath(
    Vertex<E> source,
    Vertex<E> destination, {
    Map<Vertex<E>, Pair<E>?>? paths,
  }) {
    final allPaths = paths ?? shortestPaths(source);
    if (!allPaths.containsKey(destination)) return [];
    var current = destination;
    final path = <Vertex<E>>[current];
    while (current != source) {
      final previous = allPaths[current]?.vertex;
      if (previous == null) return [];
      path.add(previous);
      current = previous;
    }
    return path.reversed.toList();
  }

  Map<Vertex<E>, List<Vertex<E>>> shortestPathsLists(Vertex<E> source) {

    final allPaths = shortestPaths(source);

    final allPathsLists = <Vertex<E>, List<Vertex<E>>>{};
    for (final vertex in graph.vertices) {
      final path = shortestPath(source, vertex, paths: allPaths);
      allPathsLists[vertex] = path;
    }

    return allPathsLists;
  }
//final edges = graph.edges(current.vertex!);
//       for(final e in edges){
//         final w =  graph.weight(source, e.destination);
//         if(w != null) {
//           final path = paths[e.destination];
//           if(path == null){
//             final pairs = Pair(w, e.destination);
//             paths[e.destination] = pairs;
//           } else {
//             final newDistance = path.distance + w;
//             final newPair = Pair(newDistance, e.destination);
//             paths[e.destination] =  newPair;
//             queue.enqueue(newPair);
//           }
//
//         }
//       }
}
