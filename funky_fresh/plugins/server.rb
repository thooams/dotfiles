class Server < Plugin

  def handle_command(p)
    p.option 'server', '-s', '--server', 'Launch foreman start'
    p.action do |_, options|
      execute options if options["server"]
    end
  end

  def execute(options)
    "bundle exec foreman start #{ '-f Procfile.linux' unless os_mac? }"
  end

  def os_mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

end
