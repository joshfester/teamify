require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  def test_teamify
    assert Membership.new.present?
  end
end