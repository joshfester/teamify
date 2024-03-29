module Teamify
  module Memberships
    module Base
      extend ActiveSupport::Concern

      included do
        belongs_to :team, class_name: Teamify.team_class_name
        belongs_to :member, polymorphic: true
      end
    end
  end
end
