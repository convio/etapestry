module ETapestry
  class Account < BaseController
    @model = AccountModel
    @view = AccountView

    def populate_data
      populate_values
      Persona.new(@model).populate_values
      submit
    end
  end
end

