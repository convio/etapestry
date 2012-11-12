module ETapestry
  module Account
    OtherModel = Watirmark::Model.factory do
      keywords OtherView.keywords
      defaults do
        name          {"name_#{uuid}"}
        sort_name     {name}
      end
    end
  end
end