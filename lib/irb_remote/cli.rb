require 'thor'

module IRBRemote
  class CLI < Thor
    default_task :connect

    desc "connect", "Connect to remote irb server"
    def connect(*)
      IRBRemote::Client.new.start
    end

    map %w[-v --version] => :version
    desc "-v or --version", "Print the version"
    def version
      puts IRBRemote::Version
    end
  end
end
