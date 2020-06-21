module PmSender
  class Render

    AVAILABLE_ENGINES = [
      PmSender::Engines::HamlEngine,
      PmSender::Engines::ErbEngine,
    ]

    def initialize(sender)
      @sender = sender
    end

    def render
      engine_class.new(sender).render
    end

    private

    attr_reader :sender

    def engine_class
      engine = AVAILABLE_ENGINES.find {|engine| engine.new(sender).has_template? }
    ensure
      return engine if engine
      template_path = "#{PmSender.config.view_scope}/#{sender.to_partial_path}.text(.haml|.erb)"
      raise PmSender::TemplateFileNotFoundError.new(template_path)
    end

  end
end
