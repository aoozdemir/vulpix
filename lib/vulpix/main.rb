require 'socket'
require 'optparse'

module Vulpix
  def self.nwinfo
    @nw = []

    Socket.getifaddrs.each do |if_addr|
      next unless if_addr.addr.ipv4?

      name = if_addr.name
      name_info = if_addr.addr.getnameinfo.first
      ip_addr = if_addr.addr.ip_address.to_s

      @nw << { name: name, name_info: name_info, addr: ip_addr }
    end

    return @nw
  end
end
