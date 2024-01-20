require "test_helper"

module Teamify
  class TeamsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    def setup
      @team = Team.create title: "Default Team"
    end

    def test_index
      get teams_url
      assert_response :success
    end

    def test_show
      get team_url(@team)
      assert_response :success
    end

    def test_new
      get new_team_url
      assert_response :success
    end

    def test_edit
      get edit_team_url(@team)
      assert_response :success
    end

    def test_create
      team_title = "New Team"

      assert_difference("Team.count" => 1) do
        post teams_url, params: {team: {title: team_title}}
      end

      team = Team.last

      assert_redirected_to team_url(team)
      follow_redirect!
      assert_response :success

      assert_equal team_title, team.title
    end

    def test_update
      team_title = "New Team"

      patch team_url(@team), params: {team: {title: team_title}}

      assert_redirected_to team_url(@team)
      follow_redirect!
      assert_response :success

      assert_equal team_title, @team.reload.title
    end

    def test_destroy
      assert_difference("Team.count", -1) do
        delete team_url(@team)
      end
      assert_redirected_to teams_url
    end
  end
end
