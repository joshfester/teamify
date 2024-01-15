module Teamify
  module Models

    def teamify(model, **kwargs)
      case model
      when :team
        include Teams::Base 
      else
        raise "Teamify:: invalid model type '#{model}'"
      end
    end

  end
end