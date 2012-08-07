module ETapestry
  module Account
    class Persona < BaseController
      @model = PersonaModel
      @view = PersonaView
      @search = Search

      def verify_persona_type
        @model.persona_type.should == @view.persona_type.selected_options.first.text.delete('*').strip
      end
    end
  end
end
