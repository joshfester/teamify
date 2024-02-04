require "test_helper"

module Teamify
  class InvitationsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @invitation_class = Teamify.invitation_class
      @team = Teamify.team_class.create(title: "Test Team")
      @from_membership = Teamify.membership_class.create(team: @team, member: Teamify.member_class.create(email: "test@example.com"))
      @invitation = @invitation_class.create(team: @team, from_membership: @from_membership)
    end

    test "should get index" do
      get team_invitations_url(@team)
      assert_response :success
    end

    test "should get new" do
      get new_team_invitation_url(@team)
      assert_response :success
    end

    test "should create invitation" do
      assert_difference("Invitation.count") do
        post team_invitations_url(@team), params: {invitation: {from_membership_id: @from_membership.id}}
      end

      assert_redirected_to invitation_url(@invitation_class.last)
    end

    test "should show invitation" do
      get invitation_url(@invitation)
      assert_response :success
    end

    test "should destroy invitation" do
      assert_difference("Invitation.count", -1) do
        delete invitation_url(@invitation)
      end

      assert_redirected_to team_invitations_url(@team)
    end
  end
end
