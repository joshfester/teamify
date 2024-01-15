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

      include concern
    end
  end
end
