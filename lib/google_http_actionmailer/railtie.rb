module GoogleHttpActionmailer
  class Railtie < Rails::Railtie
    initializer 'google_http_actionmailer.add_delivery_method', before: 'action_mailer.set_configs' do
      ActionMailer::Base.add_delivery_method(:google_http_actionmailer, GoogleHttpActionmailer::DeliveryMethod)
    end
  end
end
