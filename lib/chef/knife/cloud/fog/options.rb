#
# Author:: Kaustubh Deorukhkar (<kaustubh@clogeny.com>)
# Copyright:: Copyright (c) 2013 Opscode, Inc.
#

class Chef
  class Knife
    class Cloud
      module FogOptions

        def self.included(includer)
          includer.instance_eval do
            option :fog_version,
              :long => "--fog-version version",
              :description => "Fog gem version to use. Use the ruby gem version strings",
              :default => "",
              :proc => Proc.new { |v| Chef::Config[:knife][:cloud_fog_version] = v}
          end
        end

      end
    end
  end
end
