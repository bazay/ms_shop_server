def dispatch(action = :index, params = {})
  get action, params: params
end
