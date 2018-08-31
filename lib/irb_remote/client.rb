require 'irb'
require 'drb/drb'

module IRBRemote
  class Client
    def initialize
      @drb_server_host = IRBRemote.config.host
      @drb_server_port = IRBRemote.config.port
    end

    def start
      DRb.start_service
      server = DRbObject.new_with_uri("druby://#{@drb_server_host}:#{@drb_server_port}")
      server.connected($stdin, $stdout)
    end
  end
end
