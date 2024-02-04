require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  def test_teamify
    membership = Teamify.membership_class.new
    assert_nil membership.team
    assert_nil membership.member
  end
end
