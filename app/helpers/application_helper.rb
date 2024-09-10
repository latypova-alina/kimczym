module ApplicationHelper
  def dynamodb
    @dynamodb ||= DynamoDb.client
  end

  def find_item(items, key_name)
    items.find { |obj| obj.key_name == key_name }
  end
end
