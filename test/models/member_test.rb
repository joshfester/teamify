require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def test_teamify
    member = Teamify.member_class.new
    assert_equal 0, member.memberships.length
    assert_equal 0, member.teams.length
  end
end
