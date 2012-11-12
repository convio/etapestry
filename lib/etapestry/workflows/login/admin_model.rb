module ETapestry
  module Login
    AdminModel = Watirmark::Model.factory do
      keywords AdminView.keywords
      defaults do
        username {Watirmark::Configuration.instance.username}
        password {Watirmark::Configuration.instance.password}
      end
    end
  end
end
