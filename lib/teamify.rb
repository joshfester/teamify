require "teamify/models"
require "teamify/railtie" if defined?(Rails::Railtie)

require "teamify/version"
require "teamify/engine"

module Teamify
  mattr_accessor :team_class

  def self.team_class
    @@team_class.constantize
  end
end
