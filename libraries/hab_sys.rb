# Author: Eric Calabretta
require 'httpclient'

class HabSys < Inspec.resource(1)
  name 'hab_sys'
  desc 'Tests habitat sys'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
  end

  def hab_version
    service['sys']['version']
  end

  def service
    @service ||= JSON.parse(inspec.http("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}").body)
  end
end
