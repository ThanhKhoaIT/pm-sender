module PmSender::Engines
  class ErbEngine < ::PmSender::Engines::Base

    FORMAT = 'erb'

    def render
      ERB.new(template).result(sender.__binding__)
    end

  end
end
