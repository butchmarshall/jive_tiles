module JiveTiles
	module Concerns
		module Controllers
			module Tiles
				extend ActiveSupport::Concern

				def create
					@tile = Jive::Tile::Model.new(register_params)
					@tile.name = params[:name]
					@tile.uninstalled = false

					render :nothing => true, :status => ((@tile.save)? 204 : 403)
				end

				def destroy
					status = 403

					@tile = Jive::Tile::Model.where(unregister_params).first
					if @tile && @tile.update_attributes(:uninstalled => true)
						status = 204
					end

					render :nothing => true, :status => status
				end

				private
					def json_params
						ActionController::Parameters.new(JSON.parse(request.body.read))
					end

					def unregister_params
						json_params.tap { |whitelisted|
							whitelisted[:tenant_id] = whitelisted[:tenantId]
							whitelisted[:client_id] = whitelisted[:clientId]
							whitelisted[:jive_url] = whitelisted[:jiveUrl]
							whitelisted[:jive_signature_url] = whitelisted[:jiveSignatureURL]
						}.permit(
							:tenant_id,
							:client_id,
							:jive_url,
							:jive_signature_url
						)
					end

					def register_params
						json_params.tap { |whitelisted|
							whitelisted[:guid] = whitelisted[:guid]
							whitelisted[:remote_id] = whitelisted[:remoteID]
							whitelisted[:config] = whitelisted[:config]
							whitelisted[:name] = whitelisted[:name]
							whitelisted[:jive_url] = whitelisted[:jiveUrl]
							whitelisted[:tenant_id] = whitelisted[:tenantId]
							whitelisted[:push_url] = whitelisted[:pushUrl]
							whitelisted[:code] = whitelisted[:code]
						}.permit(
							:guid,
							:remote_id,
							:config,
							:name,
							:jive_url,
							:tenant_id,
							:push_url,
							:cod
						)
					end
			end
		end
	end
end