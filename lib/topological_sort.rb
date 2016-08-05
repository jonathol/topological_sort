require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  # # Khan's
  # # O(|V|+|E|)
  # in_edge_counts = {}
  # queue = []
  #
  # vertices.each do |v|
  #   in_edge_counts[v] = v.in_edges.count
  #   queue << v if v.in_edges.empty?
  # end
  #
  # sorted_vertices = []
  #
  # until queue.empty?
  #   vertex = queue.shift
  #   sorted_vertices << vertex
  #   vertex.out_edges.each do |e|
  #     to_vertex = e.to_vertex
  #     in_edge_counts[to_vertex] -= 1
  #
  #     queue << to_vertex if in_edge_counts[to_vertex] == 0
  #   end
  # end
  #
  # sorted_vertices

  # Tarjans
  ordering = []
  explored = Set.new

  vertices.each do |v|
    dfs!(v, explored, ordering) unless explored.include?(v)
  end

  ordering
end

def dfs!(vertex, explored, ordering)
  explored.add(vertex)

  vertex.out_edges.each do |e|
    new_vertex = e.to_vertex
    dfs!(new_vertex, explored, ordering) unless explored.include?(new_vertex)
  end

  ordering.unshift(vertex)
end
