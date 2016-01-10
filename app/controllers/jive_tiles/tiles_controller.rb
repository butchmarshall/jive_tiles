require_dependency "jive_tiles/application_controller"

module Concerns
	module Controllers
		module Tiles
			extend JiveTiles::Concerns::Controllers::Tiles
		end
	end
end

module JiveTiles
	class TilesController < ApplicationController
		include Concerns::Controllers::Tiles
	end
end
