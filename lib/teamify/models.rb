module Teamify
  module Models
    def teamify(model, **kwargs)
      case model
      when :team
        teamify_team kwargs
      when :membership
        teamify_membership kwargs
      else
        raise "Teamify:: invalid model type '#{model}'"
      end
    end

    private

    def teamify_team(options)
      options[:membership_class] ||= "Membership"
      Teams::Base.const_set :TEAMIFY_MEMBERSHIP_CLASS, options[:membership_class]
      include Teams::Base
    end

    def teamify_membership(options)
      options[:team_class] ||= "Team"
      Memberships::Base.const_set :TEAMIFY_TEAM_CLASS, options[:team_class]
      include Memberships::Base
    end
  end
end
