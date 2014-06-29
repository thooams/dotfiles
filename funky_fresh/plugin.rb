class Plugin

  APPDIR = "#{Dir.home}/Apps"

  def self.plugins
    @plugins ||= []
  end

  def self.inherited(klass)
    @plugins ||= []

    @plugins << klass
  end

  # Usually a good idea for debugging if you have lots of methods
  def handle_command(p)
    raise "#{self.class.name} doesn't implement `handle_command`!"
  end

  def go_to(dir)
    system "cd #{ APPDIR }/#{ dir } && $SHELL"
  end

end
