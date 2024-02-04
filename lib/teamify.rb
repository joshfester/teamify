require "teamify/version"
require "teamify/engine"

require "teamify/models"
require "teamify/railtie"

module Teamify
  mattr_accessor :team_class_name, default: "Team"
  mattr_accessor :membership_class_name, default: "Membership"
  mattr_accessor :member_class_name, default: "User"
  mattr_accessor :invitation_class_name, default: "Invitation"
  mattr_accessor :team_path, default: "teams"
  mattr_accessor :membership_path, default: "memberships"
  mattr_accessor :invitation_path, default: "invitations"

  def self.team_class
    team_class_name.constantize
  end

  def self.membership_class
    membership_class_name.constantize
  end

  def self.member_class
    member_class_name.constantize
  end

  def self.invitation_class
    invitation_class_name.constantize
  end
end
