Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :people, path: 'pessoas', only: [:create]

    resources :job_applications, path: 'candidaturas', only: [:create]
    
    resources :job_opportunities, path: 'vagas', only: [:create] do
      resource :job_applications, path: 'candidaturas', only: [] do
        get 'ranking'
      end
    end
  end
end
