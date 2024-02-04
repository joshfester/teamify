module Teamify
  module Invitations
    module Base
      extend ActiveSupport::Concern

      included do
        belongs_to :team, class_name: Teamify.team_class_name
        belongs_to :from_membership, class_name: Teamify.membership_class_name
      end
    end
  end
end
