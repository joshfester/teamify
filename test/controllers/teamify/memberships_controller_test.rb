require "test_helper"

module Teamify
  class MembershipsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    def setup
      @member_class = Teamify.member_class
      @membership_class = Teamify.membership_class
      @team = Teamify.team_class.create(title: "Test Team")
      @membership = @membership_class.create(team: @team, member: @member_class.create(email: "test@example.com"))
    end

    def test_index
      get team_memberships_url(@team)
      assert_response :success
    end

    def test_show
      get membership_url(@membership)
      assert_response :success
    end

    def test_new
      get new_team_membership_url(@team)
      assert_response :success
    end

    def test_create
      assert_difference("Membership.count") do
        post team_memberships_url(@team), params: {membership: {member_type: "User", member_id: @member_class.create(email: "new@example.com").id}}
      end

      assert_redirected_to membership_url(@membership_class.last)
    end

    def test_edit
      get edit_membership_url(@membership)
      assert_response :success
    end

    def test_update
      patch membership_url(@membership), params: {membership: {member_type: "User", member_id: @member_class.create(email: "update@example.com").id}}
      assert_redirected_to membership_url(@membership)
    end

    def test_destroy
      assert_difference("Membership.count", -1) do
        delete membership_url(@membership)
      end

      assert_redirected_to team_memberships_url(@team)
    end
  end
end
