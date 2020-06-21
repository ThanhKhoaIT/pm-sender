require 'erb'
require 'haml'

require 'pm_sender/version'
require 'pm_sender/error'
require 'pm_sender/services/default'
require 'pm_sender/service_caller'
require 'pm_sender/engines'
require 'pm_sender/engines/base'
require 'pm_sender/engines/erb_engine'
require 'pm_sender/engines/haml_engine'
require 'pm_sender/config'
require 'pm_sender/base'
require 'pm_sender/render'

module PmSender

  def self.config
    @config ||= PmSender::Config.new
    yield @config if block_given?
    @config
  end

end
