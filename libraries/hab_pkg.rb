# Author: Tom Robinson-Gore

require 'httpclient'

class HabPkg < Inspec.resource(1)
  name 'hab_pkg'
  desc 'Tests habitat packages'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
    # return fail_resource "Must use named parameters (eg name:'bobo')" unless @opts.is_a? Hash
    # return fail_resource 'Must provide :name param' unless @opts.keys.include? :url
  end

  def pkg_ident
    service['pkg']['ident']
  end

  def pkg_svc_user
    service['pkg']['svc_user']
  end

  def pkg_svc_group
    service['pkg']['svc_group']
  end

  def service
    # @service ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
    @service ||= JSON.parse(inspec.http("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
  end
end