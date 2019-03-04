# Author: Tom Robinson-Gore

require 'httpclient'

class HabCfg < Inspec.resource(1)
  name 'hab_cfg'
  desc 'Tests habitat services'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
    # return fail_resource "Must use named parameters (eg name:'bobo')" unless @opts.is_a? Hash
    # return fail_resource 'Must provide :name param' unless @opts.keys.include? :url
  end

  def app_name
    service['app_name']
  end

  def app_pool
    service['app_pool']
  end

  def port
    service['port']
  end

  def site_name
    service['site_name']
  end
  
  def service
    # @service ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
    @service ||= JSON.parse(inspec.http("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
  end
end