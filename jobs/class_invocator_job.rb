# Active job doesn't accept
class ClassInvocatorJob < ActiveJob::Base
  queue_as :default

  def perform(klass, klass_method, *args, &block)
    klass.constantize.send klass_method, *args, &block
  end
end
