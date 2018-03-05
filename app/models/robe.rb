require 'knn'
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



# require 'knn'
# require 'json'
# require "open-uri"
#
#
# knn = KNN.new(data)
#
# result = knn.nearest_neighbours(data[22], 8)  # ([data], k's)
#
# neighbours_id = []
# result.each do |res|
#   neighbours_id << res[0]
# end
