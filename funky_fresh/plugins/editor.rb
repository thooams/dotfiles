class Editor < Plugin

  EDITOR = 'gvim'

  def handle_command(p)
    p.option 'editor', '-e', '--editor', 'Launch gvim or other editor'
    p.action do |args, options|
      execute options if options["editor"]
    end
  end

  def execute(options)
    system "#{ EDITOR }"
  end

end
