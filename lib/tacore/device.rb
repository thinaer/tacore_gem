module TACore
  # => Device class methods
  class Device < Auth

    # @TODO NOT IN API
    # Show all devices that DO NOT have a venue_id set
    # @param token [String] Client Token after Authentication
    # @param client_id [String] used from {Client.create}
    # @return [Array<Object, Object>] in JSON format
    # def self.unassigned(token, client_id)
    #   request(:get, '/client/devices', {}, {token: token, "client_id" => client_id})
    # end

    # Device.update is used to set the venue_id.
    # @example Update the Device venue id
    #    # Using the client api_key as client["api_key"]
    #    # Using the device id as device["id"]
    #    # Using the venue id as venue["key"]
    #    device = TACore::Device.update(TACORE_TOKEN, client["api_key"], device["id"], {venue_key: venue["key"]})
    # @param token [String] Client Token after Authentication
    # @param api_key [String] used from {Client.create}
    # @param id [Integer] see {Device.all} to get the Device id
    # @param device [Object]
    # @return [Object] in JSON format
    def self.update(token, client_id, id, device = {})
      request(:put, '/device/' + id.to_s, device, {"client_id" => client_id, "token": token})
    end

    # @param token [String] Client Token after Authentication
    # @param api_key [String] used from {Client.create}
    # @param id [Integer] see {Device.unassigned} or {Device.all} to get the Device id
    # @return [Object] in JSON format
    def self.find(token, client_id, id)
      request(:get, '/device/' + id.to_s,{}, {"client_id" => client_id, "token": token})
    end

    # Display all devices that belong to this Client
    # @param token [String] Client Token after Authentication
    # @param client_id [String] used from {Client.create}
    # @return [Array<Object, Object>] in JSON format
    def self.all(token, client_id)
      request(:get, '/client/devices/', {}, {token: token, "client_id" => client_id})
    end

    # Get scan data for this device ID.
    # == Gateway (Cirrus) scan device_type
    # * Key: The device ID given when making the request
    # * Value: An array of device IDs that the device sees.
    # @example Get asset (Iris) ids that the given device sees.
    #    # Using the client api_key as client["api_key"]
    #    # Using the device id as device["id"]
    #    scans = TACore::Device.scans(token, api_key, id, "cirrus")
    #    # => {"756" => [22,35,621,503]}
    #
    # -------------------
    #
    # == Asset (Iris) scan device_type
    # * device_id: The Gateway device id that sees the given device ID
    # * last_movement: A UNIX timestap of the last time this device was seen by a new Gateway.
    # @example Get the device that sees this asset (Iris)
    #    # Using the client api_key as client["api_key"]
    #    # Using the device id as device["id"]
    #    scan = TACore::Device.scans(token, api_key, id, "iris")
    #    # => {"device_id" => 756, "last_movement" => 1464905199}
    #
    # == Scan data (raw = false)
    # With the raw setting to false you will receive the most up to date and accurate data. Data coming from this source is cleaned with our custom built service called Overlook.
    #
    # -------------------
    #
    # @TODO NO LONGER NEEDED?
    # @note Overlook is a custom service built into the ThinAer Platform that allows us to determine accurate proximity along with a simplified output for API clients.
    # @param token [String] Oauth2 Token after Authentication
    # @param api_key [String] used from {Client.create}
    # @param id [Integer] see {Device.unassigned} or {Device.all} to get the Device id
    # @param device_type [String] select the device_type see {Device.device_types}
    # @param raw [Boolean]
    # @return [Hash<raw=false> | Object<raw=true>] in JSON format
    # @note raw [Boolean] when set to `true` will give the last 10 records of scan data.
    # @since 3.4.0
    # @note Always check the CHANGELOG for update notes
    # def self.scans(token, api_key, id, device_type, raw = false)
    #   request(:get, '/api/v1/devices/' + id.to_s + '/scans/' + device_type + '?raw=' + raw.to_s, token, {:headers => {:client_api_key => api_key}})
    # end

  end
end
