#!/usr/bin/env ruby
# encoding: utf-8

# Copyright (C) 2014 Thomas HUMMEL
# @thooams

APPDIR = "#{ Dir.home }/Apps"
FFDIR  = "#{ APPDIR }/dotfiles/funky_fresh"

# gem install mercenary
require 'mercenary'
require "#{ FFDIR }/plugin.rb"

# Load plugins
Dir["#{ FFDIR }/plugins/*.rb"].each {|file| load file }

class FunkyFresh

  VERSION = "v3.1"

  def initialize
    Mercenary.program(:ff) do |p|

      p.version VERSION
      p.description logo
      p.syntax "ff <subcommand> [options]"

      #p.action do |args, options|
      #  puts "args => #{args}"
      #  puts "options => #{options}"
      #end

      Plugin.plugins.each do |plugin_class|
        plugin_class.new.handle_command p
      end

      p.command(:usage) do |c|
        c.description "Usage of #{ name }"
        c.syntax "usage"
        c.action do |args, options|
          puts 'uieu'
          system 'ff -h'
        end
      end

      p.default_command(:usage)

    end
  end

  def name
    "Funky Fresh"
  end

  def logo
    <<-eos
      \033[34m
       _____            _            _____              _
      |  ___|   _ _ __ | | ___   _  |  ___| __ ___  ___| |__   
      | |_ | | | | '_ \\| |/ / | | | | |_ | '__/ _ \\/ __| '_ \\   
      |  _|| |_| | | | |   <| |_| | |  _|| | |  __/\\__ \\ | | | 
      |_|   \\__,_|_| |_|_|\\_\\\\__, | |_|  |_|  \\___||___/_| |_| 
                              |___/                      #{VERSION}\033[0m 

    eos
  end

end

@funkyFresh ||= FunkyFresh.new
