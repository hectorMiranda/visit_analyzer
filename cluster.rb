class Cluster
    attr_accessor :center, :visits

    def initialize(center)
        @center = center
        @visits = []
    end

    def recenter!
        lat = lon = 0
        previous_center = @center

        # Sum up all coordinates for all visits
        @visits.each do |visit|
            lat += visit.latitude
            lon += visit.longitude
        end

        # Now average out the coordinates
        lat /= visits.length
        lon /= visits.length

        # Now reset the center and return the distance moved
        @center = Visit.new(lat, lon)

        previous_center.distance_to(center)
    end
end
