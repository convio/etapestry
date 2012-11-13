module ETapestry
  module Account
    class PersonaView < BaseView
      keyword(:persona_type)     {content_label('Persona').select_list}
      keyword(:start_date)       {content.text_field(:name, 'startDate')}
      keyword(:end_date)         {content.text_field(:name, 'endDate')}
      keyword(:address)          {content.text_field(:name, 'address')}
      keyword(:city)             {content.text_field(:name, 'city')}
      keyword(:state)            {content.text_field(:name, 'state')}
      keyword(:postal_code)      {content.text_field(:name, 'postalCode')}
      keyword(:county)           {content.text_field(:name, 'county')}
      keyword(:country)          {content_label('Country').select_list}
      keyword(:voice)            {content_label('Voice').text_field}
      keyword(:fax)              {content_label('Fax').text_field}
      keyword(:mobile)           {content_label('Mobile').text_field}
      keyword(:email)            {content.text_field(:name, 'emailAddress')}
      keyword(:web_page)         {content.text_field(:name, 'webAddress')}
      keyword(:note)             {content.text_field(:name, 'note')}
      keyword(:short_salutation) {content.text_field(:name, 'shortDesignation')}
      keyword(:long_salutation)  {content.text_field(:name, 'longDesignation')}

      navigation_keyword(:persona_link)     {content.link(:text, 'Personas')}

      def home(model=nil)
        persona_link.click
      end
      alias :edit :home
    end
  end
end
