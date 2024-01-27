module Teamify
  class MembershipsController < ApplicationController
    before_action :set_team, only: %i[index create new]
    before_action :set_resource, only: %i[show edit update destroy]

    # GET /teams/:team_id/memberships
    def index
      @resources = @team.memberships
    end

    # GET /memberships/1
    def show
    end

    # GET /teams/:team_id/memberships/new
    def new
      @resource = Membership.new team: @team
    end

    # GET /memberships/1/edit
    def edit
    end

    # POST /teams/:team_id/memberships
    def create
      @resource = Membership.new resource_params.merge(team: @team)

      if @resource.save
        redirect_to @resource, notice: "Membership was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /memberships/1
    def update
      if @resource.update(resource_params)
        redirect_to @resource, notice: "Membership was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /memberships/1
    def destroy
      @resource.destroy!
      redirect_to team_memberships_url(@resource.team), notice: "Membership was successfully destroyed.", status: :see_other
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Membership.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:membership).permit(:member_type, :member_id)
    end
  end
end
