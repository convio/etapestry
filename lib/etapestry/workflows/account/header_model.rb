module ETapestry
  module Account
    HeaderModel = Watirmark::Model::Base.new(*HeaderView.keywords) do
      default.name       {parent.other.name}
      default.address    {parent.persona.address}
      default.email      {parent.persona.email}
      default.website    {parent.persona.web_page}
    end
  end
end