WildlifeTracker::Application.routes.draw do
  match('species', {:via => :get, :to => 'species#index'})
  match('species', {:via => :post, :to => 'species#create'})
  match('species/new', {:via => :get, :to => 'species#new'})
  match('species/:id', {:via => :get, :to => 'species#show'})
  match('species/:id', {:via => :delete, :to => 'species#destroy'})
  match('species/:id/edit', {:via => :get, :to => 'species#edit'})
  match('species/:id', {:via => :patch, :to => 'species#update'})

  match('regions', {:via => :get, :to => 'regions#index'})
  match('regions', {:via => :post, :to => 'regions#create'})
  match('regions/new', {:via => :get, :to => 'regions#new'})
  match('regions/:id', {:via => :get, :to => 'regions#show'})
  match('regions/:id', {:via => :delete, :to => 'regions#destroy'})
  match('regions/:id/edit', {:via => :get, :to => 'regions#edit'})
  match('regions/:id', {:via => :patch, :to => 'regions#update'})

  match('sightings', {:via => :get, :to => 'sightings#index'})
  match('sightings', {:via => :post, :to => 'sightings#create'})
  match('sightings/list-all', {:via => :get, :to => 'sightings#list_all'})
  match('sightings/:id/edit', {:via => :get, :to => 'sightings#edit'})
  match('sightings/:id', {:via => :patch, :to => 'sightings#update'})
  match('sightings/:id', {:via => :delete, :to => 'sightings#destroy'})
end
