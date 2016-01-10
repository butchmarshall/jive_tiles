FactoryGirl.define do
  factory :jive_tiles_oauth_token, :class => 'JiveTiles::OauthToken' do
    scope "MyString"
token_type "MyString"
expires_in "MyString"
refresh_token "MyString"
access_token "MyString"
  end

end
