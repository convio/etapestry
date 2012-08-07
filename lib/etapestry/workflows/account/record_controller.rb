module ETapestry
  module Account
    class Record < BaseController
      @model = RecordModel
      @view = RecordView

      def populate_data
        populate_values
        Other.new(@model).populate_values
        Persona.new(@model).populate_values
        submit
      end
    end
  end
end

