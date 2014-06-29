class Directory < Plugin

  def handle_command(p)
    p.option 'directory', '-d DIR', '--directory DIR', 'Go to directory'
    p.action do |_, options|
      execute(options, p) if options["directory"]
    end
  end

  def execute(options, p)
    dir      = options["directory"]
    hash_dir = directories.detect {|f| f[:arg] == dir }

    if hash_dir.nil?
      p.logger.error "Directory '#{ dir }' unknown."
    else
      go_to(hash_dir[:path])
    end
  end

  def directories
    [
      { arg: 'eime', name: 'EIME',            path: "codde-eime/"      },
      { arg: 'rm',   name: 'Request Manager', path: "request-manager/" },
      { arg: 'rt',   name: 'Request Tracker', path: "request_tracker/" },
      { arg: 'ei',   name: 'EIME Infra',      path: "eime-infra/"      },
      { arg: 'vf',   name: 'Vimfiles',        path: "vimfiles/"        },
      { arg: 'ei',   name: 'EIME Infra',      path: "eime-infra/"      },
      { arg: 'df',   name: 'Dotfiles',        path: "dotfiles/"        }
    ]
  end

end
