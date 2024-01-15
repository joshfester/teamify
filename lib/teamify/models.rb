module Teamify
  module Models
    DEFAULT_TEAMIFY_TEAM_CLASS = "Team"
    DEFAULT_TEAMIFY_MEMBERSHIP_CLASS = "Membership"
    DEFAULT_TEAMIFY_MEMBER_CLASS = "User"

    def teamify(model, **kwargs)
      case model
      when :team
        teamify_team kwargs
      when :membership
        teamify_membership kwargs
      when :member
        teamify_member kwargs
      else
        raise "Teamify:: invalid model type '#{model}'"
      end
    end

    private

    def teamify_team(options)
      options[:membership_class] ||= DEFAULT_TEAMIFY_MEMBERSHIP_CLASS
      options[:member_class] ||= DEFAULT_TEAMIFY_MEMBER_CLASS
      Teams::Base.const_set :TEAMIFY_MEMBERSHIP_CLASS, options[:membership_class]
      Teams::Base.const_set :TEAMIFY_MEMBER_CLASS, options[:member_class]
      include Teams::Base
    end

    def teamify_membership(options)
      options[:team_class] ||= DEFAULT_TEAMIFY_TEAM_CLASS
      Memberships::Base.const_set :TEAMIFY_TEAM_CLASS, options[:team_class]
      include Memberships::Base
    end

    def teamify_member(options)
      options[:team_class] ||= DEFAULT_TEAMIFY_TEAM_CLASS
      options[:membership_class] ||= DEFAULT_TEAMIFY_MEMBERSHIP_CLASS
      Members::Base.const_set :TEAMIFY_TEAM_CLASS, options[:team_class]
      Members::Base.const_set :TEAMIFY_MEMBERSHIP_CLASS, options[:membership_class]
      include Members::Base
    end
  end
end
