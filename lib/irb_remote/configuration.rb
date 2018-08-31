module IRBRemote
  class Configuration
    attr_accessor :host, :port

    def initialize
      @host = ENV.fetch('IRB_REMOTE_HOST', 'localhost')
      @port = Integer(ENV.fetch('IRB_REMOTE_PORT', '9876'))
    end
  end
end
