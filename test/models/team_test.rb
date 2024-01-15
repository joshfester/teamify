require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def test_teamify
    team = Team.new
    assert_equal 0, team.memberships.size
    assert_equal 0, team.members.size
  end
end
