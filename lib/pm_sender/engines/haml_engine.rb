module PmSender::Engines
  class HamlEngine < ::PmSender::Engines::Base

    FORMAT = 'haml'

    def render
      Haml::Engine.new(template).render(sender)
    end

  end
end
