module ETapestry
  AccountModel = Watirmark::Model::Base.new(*AccountView.keywords) do
    default.name          {"first_#{uuid}"}
    default.sort_name     default.name
    default.email_prefix  Watirmark::Configuration.instance.email || "devnull"
    default.email_suffix  "qasendmail.corp.convio.com"
    default.email         "#{default.email_prefix}+#{uuid}@#{default.email_suffix}"
  end
end