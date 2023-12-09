require 'active_job'

class ApplicationJob < ActiveJob::Base
  self.queue_adapter = :async
end
