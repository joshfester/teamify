require "application_system_test_case"

module Teamify
  class Teams::MembershipsTest < ApplicationSystemTestCase
    setup do
      @teams_membership = teamify_teams_memberships(:one)
    end

    test "visiting the index" do
      visit teams_memberships_url
      assert_selector "h1", text: "Memberships"
    end

    test "should create membership" do
      visit teams_memberships_url
      click_on "New membership"

      click_on "Create Membership"

      assert_text "Membership was successfully created"
      click_on "Back"
    end

    test "should update Membership" do
      visit teams_membership_url(@teams_membership)
      click_on "Edit this membership", match: :first

      click_on "Update Membership"

      assert_text "Membership was successfully updated"
      click_on "Back"
    end

    test "should destroy Membership" do
      visit teams_membership_url(@teams_membership)
      click_on "Destroy this membership", match: :first

      assert_text "Membership was successfully destroyed"
    end
  end
end
