module IRBRemote
  class OutputMethod < IRB::OutputMethod
    def initialize(output)
      @stdout = output
    end

    def print(*opts)
      @stdout.print(*opts)
    end
  end
end
