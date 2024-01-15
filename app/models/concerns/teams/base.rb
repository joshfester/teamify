module Teams
  module Base
    extend ActiveSupport::Concern

    included do
      has_many :memberships,
        dependent: :destroy,
        class_name: TEAMIFY_MEMBERSHIP_CLASS,
        foreign_key: :team_id

      has_many :members, through: :memberships
      has_many :invitations
    end
  end
end
