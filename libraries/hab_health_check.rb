# Author: Eric Calabretta
require 'httpclient'

class HabHealthCheck < Inspec.resource(1)
  name 'hab_health_check'
  desc 'Tests habitat services'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
  end

  def health
    service['status']
  end

  def service
    @service ||= JSON.parse(inspec.http("#{@opts[:url]}:9631/services/#{@opts[:name]}/#{@opts[:group]}/health").body)
  end
end
