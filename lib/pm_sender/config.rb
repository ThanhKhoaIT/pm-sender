module PmSender
  class Config

    attr_accessor :sender_service
    attr_accessor :view_scope

    def initialize
      @sender_service = PmSender::Services::Default
      @view_scope = 'app/views/pm_senders'
    end

  end
end
