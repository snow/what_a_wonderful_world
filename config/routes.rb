Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, shallow: true do
    resources :incomes, except: [:index, :show]
    resources :periodic_incomes, except: [:index, :show]
    resources :expenses, except: [:index, :show]
    resources :periodic_expenses, except: [:index, :show]
    resources :monthly_stats, only: :index do
      post :regenerate, on: :collection
    end
  end
end
