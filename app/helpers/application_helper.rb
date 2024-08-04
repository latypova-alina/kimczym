module ApplicationHelper
  def dynamodb
    @dynamodb ||= DynamoDb.client
  end
end
