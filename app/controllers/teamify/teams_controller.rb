module Teamify
  class TeamsController < ApplicationController
    def index
      @resources = Team.all
    end
  end
end
