module ETapestry
  module Account
    PersonaModel = Watirmark::Model.factory do
      keywords PersonaView.keywords
      defaults do
        email { "#{Watirmark::Configuration.instance.email}+#{uuid}@qasendmail.corp.convio.com" }
      end
    end
  end
end