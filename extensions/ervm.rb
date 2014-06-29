module ExtensionsErvm

  p.command(:toto) do |c|
    c.syntax "new PATH" # do not include the program name or super commands
    c.description "Creates a new Jekyll site scaffold in PATH"
    c.option 'blank', '--blank', 'Initialize the new site without any content.'

    c.action do |args, options|
      #Jekyll::Commands::New.process(args, blank: options['blank'])
    end
  end

end
