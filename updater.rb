#!/usr/bin/env ruby
#Freifunk node highscore game
#Copyright (C) 2012 Anton Pirogov
#Licensed under The GPLv3

require './generator'
require './settings'

class Updater
  @@updater = nil

  def self.start
    return false if self.running?  #already running

    @@updater = Thread.new do
      Thread.current[:stop] = false
      Thread.current[:running] = true
      log 'Started updater thread!'
      loop do
        lasttime = Time.now
        log 'Start score update...'
        result = nil
        while result.nil?
          result = Generator.execute
          if result.nil?
            log 'Failed loading node data! Retrying in 60 seconds...'
            sleep 60
          end
        end
        log 'Scores updated!'

        while (Time.now-lasttime) < INTERVAL*60
          sleep 1
          if Thread.current[:stop]
            Thread.current[:running]=false
            log 'Stopped updater thread!'
            Thread.exit
          end
        end
      end
    end
    return true #started
  end

  def self.stop
    @@updater[:stop] = true
  end

  def self.running?
    return @@updater && @@updater[:running]
  end
end
