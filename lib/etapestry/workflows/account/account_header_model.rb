module ETapestry
  AccountHeaderModel = Watirmark::Model::Base.new(*AccountHeaderView.keywords) do
    default.name       {parent.name}
    default.address    {parent.persona.address}
    default.email      {parent.persona.email}
    default.website    {parent.persona.web_page}
  end
end