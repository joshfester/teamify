require "teamify/version"
require "teamify/engine"

require "teamify/railtie"
require "teamify/models"
require "teamify/routing_mapper"
require "teamify/routes"

module Teamify
  mattr_accessor :team_class, default: "Team"
  mattr_accessor :membership_class, default: "Membership"
  mattr_accessor :member_class, default: "Member"
end
