module ETapestry
  module Account
    HeaderModel = Watirmark::Model.factory do
      keywords HeaderView.keywords
      defaults do
        name       {parent.other.name}
        address    {parent.persona.address}
        email      {parent.persona.email}
        website    {parent.persona.web_page}
      end
    end
  end
end