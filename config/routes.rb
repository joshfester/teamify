Teamify::Engine.routes.draw do
  resources Teamify.team_path do
    resources Teamify.membership_path, shallow: true
  end
end
