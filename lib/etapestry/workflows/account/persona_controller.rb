module ETapestry
  class Persona < BaseController
    @model = PersonaModel
    @search = AccountSearch
    @view = PersonaView

    def verify_persona_type
      @model.persona_type.should == @view.persona_type.selected_options.first.text.delete('*').strip
    end
  end
end
