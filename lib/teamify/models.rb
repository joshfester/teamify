module Teamify
  module Models
    def teamify(model)
      concern = case model
      when :team
        Teams::Base
      when :membership
        Memberships::Base
      when :member
        Members::Base
      else
        raise "Teamify:: invalid model type '#{model}'"
      end

      include concern
    end
  end
end
