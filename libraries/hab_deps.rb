# Author: Tom Robinson-Gore
require 'httpclient'

class HabDeps < Inspec.resource(1)
  name 'hab_deps'
  desc 'Tests habitat services'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
    # return fail_resource "Must use named parameters (eg name:'bobo')" unless @opts.is_a? Hash
    # return fail_resource 'Must provide :name param' unless @opts.keys.include? :url
  end

  def deps
    deps['pkg']['deps'].detect { |p| p['name'] == 'cacerts' }
  end

  # def service
  #   @service ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
  # end

  def deps
    @deps ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/services/np-mongodb/default").body)
  end
  # np-mongodb.default

end
