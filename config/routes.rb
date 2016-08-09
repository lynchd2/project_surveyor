Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :surveys do
    resources :multiple_choices
    resources :number_ranges
  end

  resources :multiple_choices do
    resources :choices, defaults: {choiceable: "MultipleChoice"}
  end

  resources :number_ranges do 
    resources :choices, defaults: {choiceable: "NumberRange"}
  end

  root "surveys#index"
end
