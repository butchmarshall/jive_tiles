JiveTiles::Engine.routes.draw do
	post 'register' => "tiles#create", :as => :register_tile
	post 'unregister' => "tiles#destroy", :as => :unregister_tile
end
