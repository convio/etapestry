#TODO: figure out way to not require this
require_relative 'persona_model'
require_relative 'header_model'
require_relative 'other_model'


module ETapestry
  module Account
    RecordModel = Watirmark::Model.factory do
      keywords RecordView.keywords
      search_term {other.name}
      model OtherModel
      model PersonaModel
      model HeaderModel
      model SearchModel
    end
  end
end