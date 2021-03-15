Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/search", to: "hotels#search", as: :hotels_search
      post "/make_reservation", to: "hotels#make_reservation", as: :make_reservation
    end
  end
end
