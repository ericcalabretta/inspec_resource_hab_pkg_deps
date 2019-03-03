# Author: Tom Robinson-Gore

require 'httpclient'

class HabService < Inspec.resource(1)
  name 'hab_service'
  desc 'Tests habitat services'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
    # return fail_resource "Must use named parameters (eg name:'bobo')" unless @opts.is_a? Hash
    # return fail_resource 'Must provide :name param' unless @opts.keys.include? :url
  end

  def bldr_url
    service['bldr_url']
  end

  def channel
    service['channel']
  end

  def service_group
    service['service_group']
  end

  def topology
    service['topology']
  end

  def update_strategy
    service['update_strategy']
  end

  def desired_state
    service['desired_state']
  end

  def service
    # @service ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
    @service ||= JSON.parse(inspec.http("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
  end
end