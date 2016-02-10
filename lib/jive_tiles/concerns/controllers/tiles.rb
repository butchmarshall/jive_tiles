module JiveTiles
	module Concerns
		module Controllers
			module Tiles
				extend ActiveSupport::Concern

				def create
					@tile = Jive::Tile::Model.new(register_params)
					@tile.add_on = self.get_add_on
					@tile.name = params[:name] || ""
					@tile.uninstalled = false

					render :nothing => true, :status => ((@tile.save)? 200 : 403)
				end

				def destroy
					status = 403

					@tile = Jive::Tile::Model.where(unregister_params).first
					if @tile && @tile.update_attributes(:uninstalled => true)
						status = 200
					end

					render :nothing => true, :status => status
				end

				protected
					def get_add_on
						Jive::AddOn::Model.where(:client_id => env["jive.client_id"], :tenant_id => env["jive.tenant_id"]).first
					end

				private
					def json_params
						ActionController::Parameters.new(JSON.parse(request.body.read))
					end

					def unregister_params
						json_params.tap { |whitelisted|
							whitelisted[:tenant_id] = whitelisted[:tenantId]
							whitelisted[:jive_url] = whitelisted[:jiveUrl]
							whitelisted[:guid] = whitelisted[:guid]
						}.permit(
							:tenant_id,
							:jive_url,
							:guid,
						)
					end

					def register_params
						data = json_params

						data.tap { |whitelisted|
							whitelisted[:tile_id] = whitelisted[:id]

							whitelisted[:code] = whitelisted[:code]
							whitelisted[:config] = whitelisted[:config]
							whitelisted[:guid] = whitelisted[:guid]
							whitelisted[:jive_url] = whitelisted[:jiveUrl]
							whitelisted[:name] = whitelisted[:name]
							whitelisted[:parent] = whitelisted[:parent]
							whitelisted[:place_uri] = whitelisted[:placeUri]							
							whitelisted[:tenant_id] = whitelisted[:tenantId]
							whitelisted[:url] = whitelisted[:url]

							whitelisted[:remote_id] = whitelisted[:remoteID]
							whitelisted[:push_url] = whitelisted[:pushUrl]
						}.permit(
							:tile_id,
							:code,
							:guid,
							:jive_url,
							:name,
							:parent,
							:place_uri,
							:tenant_id,
							:url,

							:remote_id,
							:push_url,
						).merge(
							:config => data[:config]
						)
					end
			end
		end
	end
end