require "irb_remote/configuration"
require "irb_remote/version"
require "irb_remote/core_ext/binding"

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
