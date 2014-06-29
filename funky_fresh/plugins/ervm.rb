class Ervm < Plugin

  def handle_command(p)
    p.command(:ervm) do |c|
      c.syntax "ervm [options]"
      c.description "Easy RVM - Create easily rvm environment
                        Creates a new ruby env and gemset / gemset and initialize env
                        with two files: ruby-version and gemset-version"
      c.option 'ruby_version', '-r', '--ruby-version ruby-version', 'Create new ruby version env'
      c.option 'gemset_name',  '-g', '--gemset-name gemset-name', 'Create new gemset'

      c.action do |_, options|
        execute options
      end
    end
  end

  def execute(options)
    gemset_name  = options["gemset-name"]
    ruby_version = options["ruby-version"]

    if gemset_name.nil?
      system "rvm use --default"
    else
      system "rvm use #{ ruby_version }"
    end
    system "rvm gemset create #{ gemset_name }"
    system "rvm gemset use #{ gemset_name }"
    system "touch .ruby-version && echo '#{ ruby_version }' > .ruby-version"
    system "touch .ruby-gemset && echo '#{ gemset_name }' > .ruby-version"
  end

end
