module DynamoDb
  class << self
    def client
      set_credentials

      Aws::DynamoDB::Client.new
    end

    def table(table_name)
      set_credentials

      Aws::DynamoDB::Resource.new(client:).table(table_name)
    end

    private

    def set_credentials
      Aws.config[:credentials] = Aws::Credentials.new(
        ENV["AWS_ACCESS_KEY_ID"],
        ENV["AWS_SECRET_ACCESS_KEY"]
      )
    end
  end
end
