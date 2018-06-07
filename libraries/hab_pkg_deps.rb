# Author: Eric Calabretta
require 'httpclient'

class HabPkgDeps < Inspec.resource(1)
  name 'hab_pkg_deps'
  desc 'Tests habitat services'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
  end

  def origin
    service['pkg']['deps'].detect { |p| p['name'] == "#{@opts[:pkg_name]}" }['origin']
  end

  def release
    service['pkg']['deps'].detect { |p| p['name'] == "#{@opts[:pkg_name]}" }['release'].to_f
  end

  def version
    service['pkg']['deps'].detect { |p| p['name'] == "#{@opts[:pkg_name]}" }['version']
  end

  def service
    @service ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
  end
end
