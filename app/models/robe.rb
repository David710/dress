# require 'knn'
class Robe < ApplicationRecord

  def nearest_neighbours(data, nb_neighbours)
    # take the complete feature vector data set, and the number of neighbours.
    # give an array with the index (in the array) of the nearest neighbours

    knn = KNN.new(data)

    neighbours = knn.nearest_neighbours(JSON.parse(self.feature_vector), nb_neighbours)

    neighbours_id = []
    neighbours.each do |neigh|
      neighbours_id << neigh[0]
    end

    return neighbours_id

  end

end

class KNN
  def initialize(data, options={})
    @data = data
    @distance_measure = options[:distance_measure] || :euclidean_distance
  end

  def nearest_neighbours(input, k=4)
    find_closest_data(input, k)
  end

  private

  def find_closest_data(input, k)
    begin
      calculated_distances = []

      @data.each_with_index do |datum, index| #Ye olde english
        # distance = input.send(@distance_measure, datum)
        distance = 0
        for i in 0..( input.length-1 )
          distance = distance + (input[i] - datum[i])**2
        end
        distance = distance**(0.5)
        calculated_distances << [index, distance, datum]
      end

      calculated_distances.sort {|x, y| x[1] <=> y[1]}.first(k)
    rescue NoMethodError
      raise "Hey, that's not a measurement. Read the README for available measurements"
    end
  end
end
