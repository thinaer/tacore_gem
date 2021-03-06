module TACore
  # =>  Client Class methods.
  # Clients are companies, or groups of users that have access to the same data. When making requests it is important to keep the client api_key
  class Client < Auth
    # Get all Clients that belong to this application
    # @param token [String] Client Token after Authentication
    # @return [Array] in JSON format
    def self.all(token)
      response = request(:get, '/application',{}, {"token": token})
      return response["clients"]
    end

    # Allows an application to add a Client
    # @param token [String] Client Token after Authentication
    # @param client [Object]
    # @return [Object] in JSON format - the new client
    # @note The new Client will be owned by the application creating it.
    def self.create(token, client = {})
      request(:post, '/client', client, {"token": token})
    end

    # Get details on a specific client by client_id
    # @param token [String] Client Token after Authentication
    # @param client_id [String] used from {Client.create}
    # @return [Object] in JSON format
    def self.find(token, client_id)
      request(:get, '/client/' + client_id.to_s, {}, {"token": token})
    end

    # Update a client details via api_key
    # @param token [String] Client Token after Authentication
    # @param client_id [String] used from {Client.create}
    # @param client [Object] Client params
    # @return [Object] in JSON format
    # @note The `client` object currently only supports `name`
    def self.update(token, client_id, client = {})
      request(:put, '/client/' + client_id.to_s, {"token": token})
    end

    # Delete a client by id
    # @param token [String] Client Token after Authentication
    # @param client_id [String] used from {Client.create}
    def self.destroy(token, client_id)
      request(:delete, '/client/' + client_id.to_s, {"token": token})
    end

    # Get all devices assigned to this client-id
    # @param token [String] Client Token after Authentication
    # @param client_id [String] used from {Client.create}
    # @return [Object] in JSON format
    def self.devices(token, client_id)
      request(:get, '/client/' + client_id.to_s + '/devices',{}, {"token": token})
    end

    # Get all gateways assigned to this client-id
    # @param token [String] Client Token after Authentication
    # @param client_id [String] used from {Client.create}
    # @return [Object] in JSON format
    def self.gateways(token, client_id)
      request(:get, '/client/' + client_id.to_s + '/gateways',{}, {"token": token})
    end

    # Get all Venues created by this client-id
    # @param token [String] Client Token after Authentication
    # @param client_id [String] used from {Client.create}
    # @return [Object] in JSON format
    def self.venues(token, client_id)
      request(:get, '/client/' + client_id.to_s + '/venues',{}, {"token": token})
    end

  end
end
