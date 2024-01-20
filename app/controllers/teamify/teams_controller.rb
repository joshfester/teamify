module Teamify
  class TeamsController < ApplicationController
    def index
      @resources = Team.all.limit(20)
    end

    def show
      @resource = find_by_id
    end

    def edit
      @resource = find_by_id
    end

    def update
      @resource = find_by_id

      if @resource.update(update_params)
        redirect_to @resource, notice: "Team was successfully updated."
      else
        render :edit
      end
    end

    def new
      @resource = Team.new
    end

    def create
      @resource = Team.new create_params

      if @resource.save
        redirect_to @resource, notice: "Team was successfully created."
      else
        render :new
      end
    end

    def destroy
      @resource = find_by_id
      @resource.destroy

      redirect_to teams_url, notice: "Team was successfully destroyed."
    end

    private

    def find_by_id
      Team.find params[:id]
    end

    def create_params
      params.require(:team).permit(:title)
    end

    def update_params
      params.require(:team).permit(:title)
    end
  end
end
