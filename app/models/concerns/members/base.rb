module Members
  module Base
    extend ActiveSupport::Concern

    included do
      has_many :memberships,
        as: :member,
        dependent: :destroy,
        class_name: TEAMIFY_MEMBERSHIP_CLASS

      has_many :teams,
        through: :memberships,
        source: :team,
        source_type: TEAMIFY_TEAM_CLASS
    end
  end
end
