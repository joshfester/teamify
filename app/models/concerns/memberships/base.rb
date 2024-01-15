module Memberships
  module Base
    extend ActiveSupport::Concern

    included do
      belongs_to :team, class_name: TEAMIFY_TEAM_CLASS
      belongs_to :member, polymorphic: true
    end

  end
end