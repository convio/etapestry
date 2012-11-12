module ETapestry
  module Account
    SearchModel = Watirmark::Model.factory do
      keywords SearchView.keywords
    end
  end
end