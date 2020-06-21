module PmSender
  class ServiceCaller

    def initialize(to, options)
      @to = to
      @options = options
    end

    def call(sender)
      @sender = sender
      phone_numbers.each do |phone_number|
        sender_service.new(phone_number, render_text).call(options)
      end
    end

    private

    attr_reader :to
    attr_reader :options
    attr_reader :sender

    def sender_service
      @sender_service ||= (options[:service] || PmSender.config.sender_service)
    ensure
      raise PmSender::NonSenderServiceError if @sender_service.blank?
    end

    def phone_numbers
      return [to] if to.is_a?(String)
      return to if to.is_a?(Array)
    end

    def render_text
      content = PmSender::Render.new(sender).render
      return content if options[:prerender].blank?
      content = options[:prerender].call(content) if options[:prerender].respond_to?(:call)
      return content
    end

  end
end
