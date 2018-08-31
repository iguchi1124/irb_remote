class Binding
  def irb_remote
    server = IRBRemote::Server.new(self)
    server.start
  end
end
