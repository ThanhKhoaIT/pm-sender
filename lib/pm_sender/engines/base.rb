module PmSender::Engines
  class Base

    attr_reader :template_path

    def initialize(sender)
      @sender = sender
      @template_path = get_template_path
    end

    def has_template?
      File.exist?("#{template_path}")
    end

    private

    attr_reader :sender

    def get_template_path
      "#{PmSender.config.view_scope}/#{sender.to_partial_path}.text.#{self.class::FORMAT}"
    end

    def template
      raise PmSender::TemplateFileNotFoundError.new(template_path) unless has_template?
      File.read(template_path)
    end

  end
end
