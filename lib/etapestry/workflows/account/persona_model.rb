module ETapestry
  module Account
    PersonaModel = Watirmark::Model::Base.new(*PersonaView.keywords) do
      default.email { "#{Watirmark::Configuration.instance.email}+#{uuid}@qasendmail.corp.convio.com" }
    end
  end
end