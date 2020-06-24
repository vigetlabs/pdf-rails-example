Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  resources :viewer_tutorials
  match "(*path)", to: "application#render_404", via: :all

end
