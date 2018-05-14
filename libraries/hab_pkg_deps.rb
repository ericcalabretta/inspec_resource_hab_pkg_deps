# Author: Tom Robinson-Gore
require 'httpclient'

class HabPkgDeps < Inspec.resource(1)
  name 'hab_pkg_deps'
  desc 'Tests habitat services'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
    # return fail_resource "Must use named parameters (eg name:'bobo')" unless @opts.is_a? Hash
    # return fail_resource 'Must provide :name param' unless @opts.keys.include? :url
  end
  #
  # def pkg_deps
  #   service['pkg']['deps'].detect { |p| p['name'] == 'cacerts' }
  # end

  def pkg_deps_deps
    service['pkg']['deps'].detect { |p| p['name'] == "#{@opts[:pkg_name]}" }
  end

  # def origin
  #   array['origin']
  # end

  # def release
  #   service['pkg']['deps'].detect { |p| p['name'] == "#{@opts[:pkg_name]}" }
  # end
  #
  # def version
  #   service['pkg']['deps'].detect { |p| p['name'] == "#{@opts[:pkg_name]}" }
  # end
  # def service
  #   @service ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
  # end

  def service
    @service ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
  end
  # np-mongodb.default

end
