class Vim < Plugin

  def handle_command(p)
    p.command(:vf) do |c|
      c.syntax "vf [options]"
      c.description "Action on vimfiles"
      c.option 'update_modules', '-u', '--update', 'Update modules of vim'
      c.action do |args, options|
        execute options
      end
    end
  end

  def execute(options)
    command = []
    command <<  "cd #{ Plugin::APPDIR }/vimfiles"
    command <<  "./update.sh" if options["update_modules"]
    command <<  "$SHELL"
    system command.join(' && ')
  end

end
