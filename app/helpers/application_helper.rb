module ApplicationHelper
	def dynamodb
		@dynamodb ||= DynamoDB.client
	end
end
