module PmSender
  class Error < StandardError; end
  class NonSenderServiceError < Error; end
  class TemplateFileNotFoundError < Error; end
end
