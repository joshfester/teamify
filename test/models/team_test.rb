require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def test_teamify
    team = Teamify.team_class.new
    assert_equal 0, team.memberships.size
    assert_equal 0, team.members.size
  end
end
