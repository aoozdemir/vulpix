require "thor"
require "vulpix"

module Vulpix
  class CLI < Thor
    desc "network", "print out your network information"
    def network
      nw = Vulpix.nwinfo
      data_length = nw.map(&:values).flatten.max_by(&:length)

      nw.each do |item|
        printf "%s  %-#{data_length.length}s :: %s\n", item[:name], item[:name_info], item[:addr]
      end
    end

    default_task :network
  end
end
