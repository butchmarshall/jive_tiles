require 'rails_helper'

RSpec.describe JiveTiles::TilesController, type: :controller do
	routes { JiveTiles::Engine.routes }

	before(:all) do
		stub_request(:post, "https://market.apps.jivesoftware.com/appsmarket/services/rest/jive/instance/validation/8ce5c231-fab8-46b1-b8b2-fc65deccbb5d").
				 with(:body => "clientId:2zm4rzr9aiuvd4zhhg8kyfep229p2gce.i\nclientSecret:09da4b6f11102012b476a686fabb37a61240ba89477f0fec4d0f974b428dd141\njiveSignatureURL:https://market.apps.jivesoftware.com/appsmarket/services/rest/jive/instance/validation/8ce5c231-fab8-46b1-b8b2-fc65deccbb5d\njiveUrl:https://sandbox.jiveon.com\ntenantId:b22e3911-28ef-480c-ae3b-ca791ba86952\ntimestamp:2015-11-20T16:04:55.895+0000\n",
					  :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby', 'X-Jive-Mac'=>'0YqbK1nW+L+j3ppE7PHo3CvM/pNyHIDbNwYYvkKJGXU='}).
				 to_return(:status => 204, :body => "", :headers => {})
	end

	before(:each) do
		@header_params = {
			:CONTENT_TYPE => 'application/json',
			:ACCEPT => 'application/json',
			:name => "dummy"
		}
		@add_on = Jive::AddOn.create({
			"tenant_id"=>"b22e3911-28ef-480c-ae3b-ca791ba86952",
			"client_id"=>"2zm4rzr9aiuvd4zhhg8kyfep229p2gce.i",
			"client_secret"=>"evaqjrbfyu70jlvnap8fhnj2h5mr4vus.s",
			"jive_url"=>"https://sandbox.jiveon.com",
			"jive_signature"=>"0YqbK1nW+L+j3ppE7PHo3CvM/pNyHIDbNwYYvkKJGXU=",
			"jive_signature_url"=>"https://market.apps.jivesoftware.com/appsmarket/services/rest/jive/instance/validation/8ce5c231-fab8-46b1-b8b2-fc65deccbb5d",
			"timestamp"=>'2015-11-20T16:04:55.895+0000',
		})
	end

	describe 'POST register' do
		it 'should register the tile when passed correct parameters' do
			puts @add_on.inspect
		end
	end

	describe 'POST unregister' do
	end
end
