module ETapestry
  module Login
    AdminModel = Watirmark::Model::Base.new(*AdminView.keywords) do
      default.username {Watirmark::Configuration.instance.username}
      default.password {Watirmark::Configuration.instance.password}
    end
  end
end
