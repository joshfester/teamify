require "test_helper"

class TeamTest < ActiveSupport::TestCase
  def test_teamify
    assert Team.new.present?
  end
end