module ETapestry
  LoginModel = Watirmark::Model::Base.new(*LoginView.keywords) do
    default.username {Watirmark::Configuration.instance.username}
    default.password {Watirmark::Configuration.instance.password}
  end
end
