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

    def test_index
      get team_invitations_url(@team)
      assert_response :success
    end

    def test_new
      get new_team_invitation_url(@team)
      assert_response :success
    end

    def test_create
      assert_difference("Invitation.count") do
        post team_invitations_url(@team), params: {invitation: {from_membership_id: @from_membership.id}}
      end

      assert_redirected_to invitation_url(@invitation_class.last)
    end

    def test_show
      get invitation_url(@invitation)
      assert_response :success
    end

    def test_destroy
      assert_difference("Invitation.count", -1) do
        delete invitation_url(@invitation)
      end

      assert_redirected_to team_invitations_url(@team)
    end
  end
end
