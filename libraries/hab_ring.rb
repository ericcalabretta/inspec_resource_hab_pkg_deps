# Author: Richard Nixon

require 'httpclient'

class HabRing < Inspec.resource(1)
  name 'hab_ring'
  desc 'Tests hab gossip rings'

  def initialize(opts = {})
    @opts = opts # Store the opts for later use
    # return fail_resource "Must use named parameters (eg name:'bobo')" unless @opts.is_a? Hash
    # return fail_resource 'Must provide :name param' unless @opts.keys.include? :url
  end

  def census_groups
    # require 'pry'; binding.pry
    census['census_groups'].keys
  end

  def local_member_id
    census['local_member_id']
  end
# "last_service_counter": 11,
# "last_election_counter": 0,
# "last_election_update_counter": 0,
# "last_membership_counter": 9,
# "last_service_config_counter": 0,
# "last_service_file_counter": 0

  def census
    @census ||= JSON.parse(::HTTPClient.get("#{@opts[:url]}:9631/census").body)
  end

end
