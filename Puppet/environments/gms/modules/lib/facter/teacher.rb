require 'socket'

Facter.add(:nodetype) do
  setcode do
    nodelist = Array.new
    hostname = Socket.gethostname
    file = IO.readlines('/etc/puppetlabs/code/environments/gms/teachermachines')
    search = file.grep Regexp.new(hostnmame)
    nodelist.push("{search}")
  end
end
