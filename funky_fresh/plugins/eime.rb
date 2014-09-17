class Eime < Plugin

  def handle_command(p)
    p.action do |_, options|
      execute(options)
    end
  end

  def execute(options)
    go_to 'codde-eime' if options.empty?
  end

end
