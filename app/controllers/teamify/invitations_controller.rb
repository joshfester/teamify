module Teamify
  class InvitationsController < ApplicationController
    before_action :set_team, only: %i[index create new]
    before_action :set_resource, only: %i[show destroy]

    # GET /teams/1/invitations
    def index
      @resources = @team.invitations
    end

    # GET /invitations/1
    def show
    end

    # GET /teams/1/invitations/new
    def new
      @resource = @team.invitations.new
    end

    # POST /teams/1/invitations
    def create
      @resource = @team.invitations.new(resource_params)

      if @resource.save
        redirect_to @resource, notice: "Invitation was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # DELETE /invitations/1
    def destroy
      @resource.destroy!
      redirect_to team_invitations_url(@resource.team), notice: "Invitation was successfully destroyed.", status: :see_other
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Teamify.invitation_class.find(params[:id])
    end

    def set_team
      @team = Teamify.team_class.find(params[:team_id])
    end

    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:invitation).permit(:team_id, :from_membership_id)
    end
  end
end
