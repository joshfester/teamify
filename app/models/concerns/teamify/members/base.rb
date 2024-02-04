module Teamify
  module Members
    module Base
      extend ActiveSupport::Concern

      included do
        has_many :memberships,
          as: :member,
          dependent: :destroy,
          class_name: Teamify.membership_class_name

        has_many :teams,
          through: :memberships,
          source: :team,
          source_type: Teamify.team_class_name
      end
    end
  end
end
