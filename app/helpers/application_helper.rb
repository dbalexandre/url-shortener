module ApplicationHelper
  def form_errors(record)
    FormErrors.new(record).render(self)
  end
end
