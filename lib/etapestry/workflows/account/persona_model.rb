module ETapestry
  PersonaModel = Watirmark::Model::Base.new(*PersonaView.keywords) do
    default.email_prefix  Watirmark::Configuration.instance.email || "devnull"
    default.email_suffix  "qasendmail.corp.convio.com"
    default.email         "#{default.email_prefix}+#{uuid}@#{default.email_suffix}"
  end
end