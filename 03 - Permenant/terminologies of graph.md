---
cssclasses:
  - center-images
  - center-titles
created: Wednesday 5th November 2025 08:26:02
---
Tags: #algo, #graph 

# Terminologies of Graph

## Basic Components

*   **Graph:** A collection of vertices (nodes) and edges connecting them. Formally, a graph G is represented as G = (V, E), where V is a set of vertices and E is a set of edges.
*   **Vertex (Node):** A fundamental unit of a graph, representing an entity or point.
*   **Edge:** A connection between two vertices in a graph.

## Types of Graphs

*   **Undirected Graph:** A graph where edges have no direction, meaning the connection between two vertices is bidirectional.
*   **Directed Graph (Digraph):** A graph where edges have a specific direction, indicated by arrows, representing a one-way connection between vertices.
*   **Weighted Graph:** A graph where edges have numerical values (weights) assigned to them. These weights can represent cost, distance, time, or capacity.
*   **Unweighted Graph:** A graph where edges do not have any numerical values or weights.
*   **Connected Graph:** A graph in which there is a path between every pair of vertices.
*   **Disconnected Graph:** A graph where at least one pair of vertices lacks a connecting path.
*   **Acyclic Graph:** A graph that contains no cycles (closed loops). An undirected acyclic graph is also known as a forest. A directed acyclic graph is often called a DAG.
*   **Cyclic Graph:** A graph that contains at least one cycle.
*   **Complete Graph:** A graph in which every pair of distinct vertices is connected by a unique edge.
*   **Bipartite Graph:** A graph whose vertices can be divided into two disjoint sets such that no two vertices within the same set are adjacent.
*   **Planar Graph:** A graph that can be drawn on a plane without any edges crossing.
*   **Simple Graph:** A graph that does not have any loops (edges connecting a vertex to itself) or multiple edges between the same pair of vertices.
*   **Multigraph:** A graph with more than one edge between a pair of vertices.
*   **Pseudograph:** A graph with loop edges.
*   **Null Graph:** A graph with no edges, though it may have one or more vertices.
*   **Trivial Graph:** A graph with only one vertex.

## Vertex and Edge Properties

*   **Adjacent Vertices:** Two vertices are adjacent if an edge connects them.
*   **Degree of a Vertex:** The number of edges incident to a vertex. In directed graphs, this is further divided into:
    *   **In-degree:** The number of incoming edges to a vertex.
    *   **Out-degree:** The number of outgoing edges from a vertex.
*   **Path:** A sequence of vertices where each adjacent pair is connected by an edge.
*   **Cycle (Circuit):** A path that starts and ends on the same vertex.
*   **Length of a Path/Walk:** The number of edges in the path or walk. In a weighted graph, it's the sum of the weights of the edges.
*   **Walk:** A sequence of alternating vertices and edges.
*   **Trail:** A walk with no repeated edges.
*   **Tree:** A connected graph that contains no cycles.
*   **Rooted Tree:** A tree with a designated preferred vertex called the root.
*   **Sub graph:** A graph whose vertices and edges are a subset of another graph (the super graph).
*   **Connected Component:** A connected subgraph within a larger graph.

## Graph Representations

*   **Adjacency Matrix:** A square matrix used to represent a graph, where rows and columns are indexed by vertices. A '1' in cell (i, j) indicates an edge between vertex 'i' and vertex 'j', and a '0' otherwise.
*   **Adjacency List:** An array or list where each index represents a vertex, and the value at that index is a list of its adjacent vertices.

---
## References