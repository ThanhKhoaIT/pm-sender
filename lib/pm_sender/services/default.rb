module PmSender::Services
  class Default

    def initialize(to, content)
      @to = to
      @content = content
    end

    def call(*options)
      puts "#{to} - #{content}: options #{options.to_s}"
    end

    private

    attr_reader :to
    attr_reader :content

  end
end
