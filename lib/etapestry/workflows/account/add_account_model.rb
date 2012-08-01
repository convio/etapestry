#TODO: figure out way to not require this
require_relative 'persona_model'

module ETapestry
  AddAccountModel = Watirmark::Model::Base.new(*AddAccountView.keywords) do
    default.name          {"name_#{uuid}"}
    default.sort_name     default.name

    add_model PersonaModel.new
  end
end