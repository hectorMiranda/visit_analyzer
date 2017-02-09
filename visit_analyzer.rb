#!/usr/bin/env ruby
require 'rubygems'
require 'csv'
require_relative './lib/cluster'
require_relative './lib/visit'

INFINITY = 1.0 / 0

def kmeans(visits, clusters_to_find = 10, halting_delta = 0.001)
    clusters = []

    # The algorithm needs to choose the starting guesses for cluster centers, it generates
    # generates clusters_to_find Cluster objects and assign to them a center from a random visit.

    (1..clusters_to_find.to_i).each do |_visit|
        index = (visits.length * rand).to_i

        random_visit = visits[index]
        c = Cluster.new(random_visit)

        clusters.push c
    end

    # Assign visit to clusters by finding, for each visit, which cluster is the closest
    loop do
        visits.each do |visit|
            min_dist = +INFINITY
            closest_cluster = nil

            # Find the closest cluster
            clusters.each do |cluster|
                dist = visit.distance_to(cluster.center)

                if dist < min_dist
                    min_dist = dist
                    closest_cluster = cluster
                end
            end

            closest_cluster.visits.push visit
        end

        max_delta = -INFINITY

        clusters.each do |cluster|
            dist_moved = cluster.recenter!
            max_delta = dist_moved if dist_moved > max_delta
        end

        return clusters if max_delta < halting_delta

        # Reset visits for the next iteration
        clusters.each do |cluster|
            cluster.visits = []
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    visits = []
    filename = ''

    if ARGV.length == 2
        filename = ARGV[0]
        clusters_to_find = ARGV[1]
    else
        puts 'Visits Analyzer 0.1'
        puts 'Usage: visit_analyzer.rb CSV_FILE CLUSTERS_TO_FIND'
        puts 'where CLUSTERS_TO_FIND represents an integer specifying how many clusters (k) to use'
        exit
    end

    CSV.foreach(filename) do |row|
        latitude = row[0].to_f
        longitude = row[1].to_f
        arrival_time = Date.parse row[2]
        departure_time = Date.parse row[3]

        visit = Visit.new(latitude, longitude, arrival_time, departure_time)
        visits.push visit
    end

    # This will group the visits together
    clusters = kmeans(visits, clusters_to_find)

    clusters.each do |cluster|
        # iterates the visits in each of these cluster to identify those that
        # they have spent a minimun of 30 hours and arrival - 1.week != PreviousWeek
    end

    # using this to debug execution...
    clusters.each_with_index do |cluster, i|
        puts "Cluster #{i}"
        total_time_in_cluster = 0
        cluster.visits.each do |visit|
            total_time_in_cluster += visit.time_spent_in_minutes
            puts visit.to_s
        end
        puts "Time spent in minutes #{cluster.time_spent_in_minutes}"
    end

end
