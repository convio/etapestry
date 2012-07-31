module ETapestry
  AccountModel = Watirmark::Model::Base.new(*AccountView.keywords) do
    default.name        {"first_#{uuid}"}
    default.sort_name   default.name
  end
end