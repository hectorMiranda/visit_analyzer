class Visit
    attr_accessor :latitude, :longitude, :arrival_time, :departure_time, :time_spent_in_minutes

    def initialize(latitude, longitude, arrival_time = nil, departure_time = nil)
        @latitude = latitude
        @longitude = longitude
        @arrival_time = arrival_time
        @departure_time = departure_time
        @time_spent_in_minutes = 0 # debugging should be (departure_time - arrival_time) / 60
    end

    def distance_to(visit)
        lat = (@latitude - visit.latitude)**2
        lon = (@longitude - visit.longitude)**2

        Math.sqrt(lat + lon)
    end

    def to_s
        "#{@latitude}, #{@longitude}, #{@arrival_time}, #{@departure_time}, #{@time_spent_in_minutes}"
    end
end
