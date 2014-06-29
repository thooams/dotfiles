class Kill < Plugin

  def handle_command(p)
    p.option 'kill', '-k', '--kill', 'Kill all ruby process'
    p.action do |_, options|
      execute options if options["kill"]
    end
  end

  def execute(options)
    "killall ruby"
  end

end
