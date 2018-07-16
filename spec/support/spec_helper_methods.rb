def dispatch(method = :get, action = :index, params = {})
  send method, action, params: params
end
