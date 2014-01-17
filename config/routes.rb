GoEat::Application.routes.draw do
  devise_for :users

  resources :city do
    resources :restaurants do
      collection do
        get 'my_restaurants'
        get "my_favourites"
      end
      resources :menu do
        member do
          get 'dishes'
      end
      resources :sale do
      end
      resources :comments do
      end
      resources :location do
      end
    end
  end


  #My exemple awesome links
  # get ":category/" => "category#restaurants" 
  # get ":city/" => "city#restaurants"
  # get ":city/:restaurant" => "restaurant#menus"
  # get ":city/:restaurant/comments" => "restaurant#get_comments"
  # post ":city/:restaurant/comments" => "restaurant#post_comment"
  # get ":city/:restaurant/:menu" => "menu#show"
  # get ":city/:restaurant/:menu/dishes" => "menu#dishes"


  #My awesome links
  #/Wrocław - lista wszystkich restauracji w mieście
  get ":city/" => "city#restaurants"
  #/Wrocław/pizzeria - lista wszystkich pizzerii w mieście
  get ":city/:category/" => "restaurant_category#restaurants" 
  #/Wrocław/35/McDonald - profil restauracji
  get ":city/:restaurant_id/:restaurant/" => "restaurant#show" 
  #/Wrocław/35/McDonald/menu - aktualne menu restauracji
  get ":city/:restaurant_id/:restaurant/menu" => "restaurant#menu"
  #/Wrocław/35/McDonald/menus - lista wszystkich menu restauracji (tylko dla zalogowanych właścicieli)
  get ":city/:restaurant_id/:restaurant/menus" => "restaurant#menus"
  #/Wrocław/35/McDonald/menu/749 - menu o id=749 (opis)
  get ":city/:restaurant_id/:restaurant/menu/:menu_id" => "menu#show"
  #/Wrocław/35/McDonald/menu/749/dishes - lista dań menu o id=749
  get ":city/:restaurant_id/:restaurant/menu/:menu_id/dishes" => "menu#dishes"
  #/Wrocław/35/McDonald/menu/749/dish/54 - potrawa o id=54
  get ":city/:restaurant_id/:restaurant/menu/:menu_id/dish/:dish_id" => "dish#show"
  #/Wrocław/35/McDonald/menu/749/dish/54/ingredients - lista składników potrawy
  get ":city/:restaurant_id/:restaurant/menu/:menu_id/dish/:dish_id/ingredients" => "dish#ingredients"
  #/Wrocław/35/McDonald/menu/749/dish/54/categories - lista kategorii potrawy
  get ":city/:restaurant_id/:restaurant/menu/:menu_id/dish/:dish_id/categories" => "dish#categories"
  #/Wrocław/35/McDonald/sales - wszystkie promocje danego lokalu
  get ":city/:restaurant_id/:restaurant/sales" => "restaurant#sales"
  #/Wrocław/35/McDonald/sale/177 - informacje o wybranej promocji
  get ":city/:restaurant_id/:restaurant/sale/:sale_id" => "sale#show"
  #/Wrocław/35/McDonald/comments - komentarze
  get ":city/:restaurant_id/:restaurant/comments" => "restaurant#comments"
  #/categories/restaurants - wyszstkie kategorie restauracji
  get "categories/restaurants" => "restaurant_category#index"
  #/categories/dishes - wszystkie kategorie dań
  get "categories/dishes" => "dish_category#index"
  #/cities - wszystkie miasta w bazie
  get "cities" => "city#index"
  #/Wrocław/?phrase="Czerwona" - szukanie po frazie

  root 'city#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
