require "irb_remote/cli"
require "irb_remote/client"
require "irb_remote/configuration"
require "irb_remote/core_ext/binding"
require "irb_remote/server"
require "irb_remote/version"

module IRBRemote
  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end
end
