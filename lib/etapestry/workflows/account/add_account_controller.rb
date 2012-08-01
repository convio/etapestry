module ETapestry
  class AddAccount < BaseController
    @model = AddAccountModel
    @view = AddAccountView

    def populate_data
      populate_values
      Persona.new(@model).populate_values
      submit
    end
  end
end

# need to find right place for this
#def verify_constituent_role
#  assert @view.role.text == "Constituent"
#end
#keyword(:role)             {content.tr(:class, 'entityTitle').tds.last}

