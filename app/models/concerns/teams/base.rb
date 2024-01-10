module Teams
  module Base
    extend ActiveSupport::Concern

    included do
      has_many :memberships, dependent: :destroy
      has_many :users, through: :memberships
      has_many :invitations
    end

    def hello
      "hi"
    end

  end
end