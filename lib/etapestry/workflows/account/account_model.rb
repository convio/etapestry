#TODO: figure out way to not require this
require_relative 'persona_model'

module ETapestry
  AccountModel = Watirmark::Model::Base.new(*AccountView.keywords) do
    search_term           {name}

    default.name          {"name_#{uuid}"}
    default.sort_name     {name}

    add_model AccountSearchModel.new
    add_model PersonaModel.new
  end
end