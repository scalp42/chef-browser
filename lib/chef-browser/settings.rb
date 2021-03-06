require 'ridley'
require 'tinyconfig'

module ChefBrowser
  class Settings < TinyConfig
    #use option method to define known options
    option :server_url, 'https://127.0.0.1'
    option :client_name, 'chef-webui'
    option :client_key, '/etc/chef-server/chef-webui.pem'
    option :connection, {}
    # Provide the desired saved searches in the following format:
    # {"displayed link name" => "query"}
    option :node_search, {}
    option :title, 'Chef Browser'
    # Disable if you use chef below 11.0; partial searches are used
    # to make searches less heavy on memory and bandwidth
    option :use_partial_search, true

    # Returns a new Ridley connection, as configured by user
    def ridley
      ::Ridley.new({
          server_url: server_url,
          client_name: client_name,
          client_key: client_key
        }.merge(connection))
    end
  end
end
