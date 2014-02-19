require 'addressable/uri'
require 'rest-client'

def create_user

  user_params = {
    :contact => {:favorite => true}
  }

  url = Addressable::URI.new(
  scheme: "http",
  host: "localhost",
  port: 3000,
  path: '/users/2/contacts/2/favorites.json').to_s


  puts RestClient.get(url)
end

create_user