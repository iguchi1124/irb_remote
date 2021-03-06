module IRBRemote
  class InputMethod < IRB::InputMethod
    # Creates a new input method object
    def initialize(input, output)
      super()

      @line_no = 0
      @line = []
      @eof = false

      input.set_encoding(IRB.conf[:LC_MESSAGES].encoding, '-')
      output.set_encoding(IRB.conf[:LC_MESSAGES].encoding, '-')

      @stdin = input
      @stdout = output
    end

    # Reads the next line from this input method.
    #
    # See IO#gets for more information.
    def gets
      @stdout.print @prompt
      line = @stdin.gets
      @line[@line_no += 1] = line
    end

    # Whether the end of this input method has been reached, returns +true+ if
    # there is no more data to read.
    #
    # See IO#eof? for more information.
    def eof?
      @stdin.eof?
    end

    # Whether this input method is still readable when there is no more data to
    # read.
    #
    # See IO#eof for more information.
    def readable_after_eof?
      true
    end

    # Returns the current line number for #io.
    #
    # #line counts the number of times #gets is called.
    #
    # See IO#lineno for more information.
    def line(line_no)
      @line[line_no]
    end

    # The external encoding for standard input.
    def encoding
      @stdin.external_encoding
    end
  end
end
