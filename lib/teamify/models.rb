module Teamify
  module Models
    DEFAULT_TEAM_CLASS = "Team"
    DEFAULT_MEMBERSHIP_CLASS = "Membership"
    DEFAULT_MEMBER_CLASS = "User"

    def teamify(model, **kwargs)
      concern = case model
      when :team
        Teams::Base
      when :membership
        Memberships::Base
      when :member
        Members::Base
      else
        raise "Teamify:: invalid model type '#{model}'"
      end

      teamify_constants concern, kwargs
      include concern
    end

    private

    def teamify_constants(concern, options)
      concern.const_set :TEAMIFY_TEAM_CLASS, options[:team_class] || DEFAULT_TEAM_CLASS
      concern.const_set :TEAMIFY_MEMBERSHIP_CLASS, options[:membership_class] || DEFAULT_MEMBERSHIP_CLASS
      concern.const_set :TEAMIFY_MEMBER_CLASS, options[:member_class] || DEFAULT_MEMBER_CLASS
    end
  end
end
