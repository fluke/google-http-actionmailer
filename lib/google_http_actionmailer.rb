require "google_http_actionmailer/version"
require "google_http_actionmailer/railtie" if defined? Rails

require "base64"

require "google/apis/gmail_v1"

module GoogleHttpActionmailer
  class DeliveryMethod
    attr_reader :service
    attr_reader :message_options

    def initialize(params)
      @service = Google::Apis::GmailV1::GmailService.new

      @service.authorization = params[:authorization]
      @service.request_options.merge params[:request_options]

      unless params[:client_options].nil?
        @service.client_options.members.each do |opt|
          opt = opt.to_sym
          unless params[:client_options][opt].nil?
            @service.client_options[opt] = params[:client_options][opt]
          end
        end
      end

      @message_options = params[:message_options] || {}
    end

    def deliver!(mail)
      user_id = message_options[:user_id] || 'me'
      message = Google::Apis::GmailV1::Message.new(
        raw:       mail.to_s,
        thread_id: mail['Thread-ID']
      )

      service.send_user_message(user_id, message, message_options)
    end
  end
end
