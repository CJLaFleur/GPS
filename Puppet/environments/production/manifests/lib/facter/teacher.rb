require 'socket'

Facter.add(:nodetype) do
  setcode do
    node_type = Array.new
    nodes = IO.readlines("/etc/puppetlabs/code/environments/gms/teachermachines")
    hostname = Socket.gethostname
    
