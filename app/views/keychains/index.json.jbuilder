json.array!(@keychains) do |keychain|
  json.extract! keychain, :id, :keyname, :keyval
  json.url keychain_url(keychain, format: :json)
end
