#!/usr/bin/env ruby
# encoding: utf-8

# Copyright (C) 2014 Thomas HUMMEL
# @thooams

module FunkyFreshUtils

  def execute_command_by_args
    instruct = []
    ARGV.each do |arg|
      instruct <<  find_command(arg)
    end
    system "#{instruct.join(' && ')} && $SHELL"
  end

  def find_command(arg)
    command = nil
    arguments.each do |line|
      if line.fetch(:arg) == arg
       command = line.fetch(:command)
       break
      end
    end
    try_or_abort command, arg
  end

  def try_or_abort(command, arg)
    unless command == nil
      command
    else
      display_argument_unknown(arg)
      abort
    end
  end

  def display_argument_unknown(arg)
    usage
    puts "L'argument '#{arg}' est inconnu, essaye autre chose !"
    puts ""
  end

  def os_mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

end

module FunkyFreshConf

  EDITOR = 'gvim'
  APPDIR = "#{Dir.home}/Apps"


  def repos
    [
      { arg: 'eime', name: 'EIME',            command: "cd #{APPDIR}/codde-eime/"      },
      { arg: 'rm',   name: 'Request Manager', command: "cd #{APPDIR}/request-manager/" },
      { arg: 'rt',   name: 'Request Tracker', command: "cd #{APPDIR}/request_tracker/" },
      { arg: 'ei',   name: 'EIME Infra',      command: "cd #{APPDIR}/eime-infra/"      },
      { arg: 'vf',   name: 'Vimfiles',        command: "cd #{APPDIR}/vimfiles/"        },
      { arg: 'ei',   name: 'EIME Infra',      command: "cd #{APPDIR}/eime-infra/"      },
      { arg: 'df',   name: 'Dotfiles',        command: "cd #{APPDIR}/dotfiles/"        }
    ]
  end

  def options
    [
      { arg: '-e',   command: EDITOR,                                                             comment: 'lance l\'éditeur dans le repo concerné'          },
      #{ arg: '-s',  command: "#{launch_server_in_new_shell_with_load_env} && zsh -f $TMPFILE",   comment: 'lance rails dans le repo' },
      { arg: '-s',   command: "bundle exec foreman start #{'-f Procfile.linux' unless os_mac?}",  comment: 'lance foreman dans le repo courant'              },
      { arg: '-u',   command: './update.sh',                                                      comment: 'mise à jour des plugins de vim'                  },
      { arg: '-k',   command: 'killall ruby',                                                     comment: 'tue tous les process ruby'                       },
      { arg: '-h',   command: 'ff',                                                               comment: 'affiche l\'aide à l\'utilisation de Funky Fresh' },
      { arg: '-v',   command: "echo #{version}",                                                  comment: 'affiche la version de Funky Fresh'               }
    ]
  end

  # def launch_server_in_new_shell_with_load_env
  #   "TMPFILE=$(mktemp --tmpdir=#{Dir.home}/Apps/) &&
  #     echo 'source #{Dir.home}/.zshrc' > $TMPFILE &&
  #     echo 'pwd' >> $TMPFILE &&
  #     echo 'rails s' >> $TMPFILE  &&
  #     echo 'rm -f $TMPFILE' >> $TMPFILE"
  # end

end

class FunkyFresh
  include FunkyFreshConf
  include FunkyFreshUtils


  def initialize
    ARGV.empty? ? puts(usage) : execute_command_by_args
  end

  def arguments
    [repos, options].flatten
  end

  def name
    'Funky Fresh'
  end

  def usage
    puts logo
    puts infos
  end

  def command_list
    options.map { |command| "#{ command.fetch :arg }  #{ command.fetch :comment }" }
  end

  def repos_list
    repos.map { |repo| "#{ repo.fetch :arg } (#{ repo.fetch :name })" }
  end

  def infos
   <<-eos
     Utilisation : ff [repository|-option][-option]
     #{name} permet de lancer des serveurs, éditer certains repos.

     Repos :
       #{ repos_list.join("\n       ") }

     Options :
       #{ command_list.join("\n       ") }

   eos
  end

  def logo
    <<-eos
      \033[34m
       _____            _            _____              _
      |  ___|   _ _ __ | | ___   _  |  ___| __ ___  ___| |__   
      | |_ | | | | '_ \\| |/ / | | | | |_ | '__/ _ \\/ __| '_ \\   
      |  _|| |_| | | | |   <| |_| | |  _|| | |  __/\\__ \\ | | | 
      |_|   \\__,_|_| |_|_|\\_\\\\__, | |_|  |_|  \\___||___/_| |_| 
                              |___/                      #{version}\033[0m 

    eos
  end

  def version
    "v.2.4"
  end

end


FunkyFresh.new
