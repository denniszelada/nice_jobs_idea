class JobCreator
  def enqueue (object, method, *args, &block)
    case object.class
    when Class, Module
      ClassInvocatorJob.perform_later object.to_s, method, *args, &block
    else
      MethodInvocatorJob.perform_later object, method, *args, &block
    end
  end
end
