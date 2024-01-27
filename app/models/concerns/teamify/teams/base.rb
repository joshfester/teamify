module Teamify
  module Teams
    module Base
      extend ActiveSupport::Concern

      included do
        has_many :memberships,
          dependent: :destroy,
          class_name: Teamify.membership_class,
          foreign_key: :team_id

        has_many :members,
          through: :memberships,
          source: :member,
          source_type: Teamify.membership_class

        has_many :invitations
      end
    end
  end
end
