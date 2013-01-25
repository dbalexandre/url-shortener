RSpec::Matchers.define :allow do |*values|
  match do |record|
    @failed_values = []
    @record = record

    values.each do |value|
      record.public_send("#{@attribute}=", value)
      record.valid?

      @failed_values << value if record.errors[@attribute].any?
    end

    @failed_values.empty?
  end

  failure_message_for_should do |record|
    "expected #{attribute_description} to be valid with #{values.inspect} (failed: #{@failed_values.inspect})"
  end

  failure_message_for_should_not do |record|
    "expected #{attribute_description} to be invalid with #{values.inspect} (passed: #{@failed_values.inspect})"
  end

  chain :for do |attribute|
    @attribute = attribute
  end

  description do
    "allow #{values.inspect} for #{attribute_description}"
  end

  def attribute_description
    "#{@record.class}##{@attribute}"
  end
end
