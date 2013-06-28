# Author:: Prabhu Das (<prabhu.das@clogeny.com>)
# Copyright:: Copyright (c) 2013 Opscode, Inc.

require 'spec_helper'
require 'chef/knife/cloud/fog/server_list_command'

describe Chef::Knife::Cloud::FogServerListCommand do

  before do
    # setup dummy app and service objects.
    @app = App.new
    @service = Object.new
    @instance = Chef::Knife::Cloud::FogServerListCommand.new(@app, @service)
  end

  it 'collects all the server instances.' do
    @servers = mock()
    @service.stub_chain(:connection, :servers, :all).and_return(@servers)
    @instance.query_resource.should == @servers
  end

  pending 'lists all the server instances.' do
    @servers = mock()
    @service.stub_chain(:connection, :servers, :all).and_return(@servers)
    @servers.stub(:sort_by)
    @servers.stub(:each).and_call_original

    @instance.run
  end

end
