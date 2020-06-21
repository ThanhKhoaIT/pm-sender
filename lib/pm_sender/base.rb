module PmSender
  class Base

    DEFAULT = :base

    attr_accessor :action_name

    class << self

      attr_accessor :action_methods

      def method_missing(method_name, *args)
        sender = self.new
        sender.action_name = method_name
        sender.public_send(method_name, *args)
      end

      def method_added(method_name)
        return if self.name == 'PmSender::Base'
        self.action_methods ||= []
        self.action_methods << method_name if self.new.methods.include?(method_name)
      end

    end

    def to_partial_path
      [
        self.class.name.demodulize.underscore.pluralize,
        self.action_name || DEFAULT,
      ].join('/')
    end

    private

    def sms(to: nil, options: {})
      caller_method = caller_locations.first.label.to_sym
      self.action_name = DEFAULT
      self.action_name = caller_method if self.class.action_methods.include?(caller_method)
      PmSender::ServiceCaller.new(to, options).call(self)
    end

  end
end
