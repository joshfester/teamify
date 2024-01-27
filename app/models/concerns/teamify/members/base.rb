module Teamify
  module Members
    module Base
      extend ActiveSupport::Concern

      included do
        has_many :memberships,
          as: :member,
          dependent: :destroy,
          class_name: Teamify.membership_class

        has_many :teams,
          through: :memberships,
          source: :team,
          source_type: Teamify.team_class
      end
    end
  end
end
