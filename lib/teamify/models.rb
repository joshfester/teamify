module Teamify
  module Models

    def teamify(model, **kwargs)
      case model
      when :team
        include Teams::Base 
      when :membership
        teamify_membership kwargs
        include Memberships::Base 
      else
        raise "Teamify:: invalid model type '#{model}'"
      end
    end

    private

    def teamify_membership(options)
      options[:team_model] ||= "Team"
      Memberships::Base.const_set :TEAMIFY_TEAM_CLASS, options[:team_model]
    end

  end
end