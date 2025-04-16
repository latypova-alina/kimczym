module WordInfoHelper
  def dynamodb
    @dynamodb ||= DynamoDb.client
  end

  def find_item(items, key_name)
    items.find { |obj| obj.key_name == key_name }
  end

  def splitted_form(word_form)
    word_form.split(".")
  end
end
