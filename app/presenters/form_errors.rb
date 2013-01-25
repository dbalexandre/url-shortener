class FormErrors
  def initialize(record)
    @record = record
  end

  def errors
    @errors ||= @record.errors.reduce([]) do |buffer, error|
      buffer + [error.last]
    end
  end

  def render(view_context)
    return if errors.empty?
    view_context.render("shared/form_errors", :errors => errors)
  end
end
