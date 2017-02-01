#!/usr/bin/env ruby
require 'rubygems'
require 'highline/import'

require_relative 'cluster'
require_relative 'visit'

def classify_user_01
    puts 'Reading csv for user_01'
end

def classify_user_02
    puts 'Reading csv for user_02'
end

begin
    puts
    loop do
        choose do |menu|
            menu.prompt = 'Please select option '
            menu.choice(:Classify_User_01) { classify_user_01 }
            menu.choice(:Classify_User_01) { classify_user_01 }
            menu.choice(:Quit, 'Exit program.') { exit }
        end
    end
end
