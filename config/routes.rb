PhcdevworksAccounts::Engine.routes.draw do

# User Routes
devise_for :users, {
class_name: "PhcdevworksAccounts::User",
module: :devise
}

# User Dashboard
match "user/profile", to: "user/pages#profile", via: "get"

namespace :user do
resources :subscriptions, class_name: "PhcdevworksAccounts::Subscription"
end

# Admin Routes
match "/admin", to: "admin/pages#dashboard", via: "get"
match "/admin/users/all", to: "admin/pages#users_list", via: "get"
match "/admin/user/:id", to: "admin/pages#user_id", via: "get"

# Old Path Support (Will be Depricated)
get "dashboard", to: "user/pages#profile"
get "admin_users_index", to: "admin/pages#dashboard"


# Subscriptions
get "billing", to: "subscriptions#show"
get "subscribe", to: "subscriptions#new"
patch "subscriptions", to: "subscriptions#update"


end
