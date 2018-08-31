require 'drb/drb'
require 'irb'
require 'irb_remote/input_method'
require 'irb_remote/output_method'

module IRBRemote
  class Server
    def initialize(b)
      @binding = b
    end

    def start
      IRB.setup(@binding.eval('__FILE__'), argv: [])
      DRb.start_service("druby://#{IRBRemote.config.host}:#{IRBRemote.config.port}", self, safe_level: 1)
      DRb.thread.join
    end

    def connected(input, output)
      $stdout = output
      workspace = IRB::WorkSpace.new(@binding)
      output.print(workspace.code_around_binding)
      irb = IRB::Irb.new(workspace, InputMethod.new(input, output), OutputMethod.new(output))
      irb.run(IRB.conf)
    rescue DRb::DRbConnError
    ensure
      DRb.stop_service
    end
  end
end
