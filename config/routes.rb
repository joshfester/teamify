Teamify::Engine.routes.draw do
  resources Teamify.team_path do
    resources Teamify.membership_path, shallow: true
    resources Teamify.invitation_path, except: [:edit, :update], shallow: true
  end
end
