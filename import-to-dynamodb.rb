require 'csv'
require 'aws-sdk-dynamodb'
require 'json'

dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')

password_file = ARGV[0]

def prepare_record(hash, prefix, count)
  params = {
    table_name: "bad-passwords",
    item: {"hash" => hash, "prefix" => prefix, "count" => count}
  }
  return params
end

def send_to_dynamodb(dynamodb, record)
  begin
    dynamodb.put_item(record)
    puts "[+] #{record[:item]["hash"]}"
  rescue Aws::DynamoDB::Errors::ServiceError => error
    puts "error: #{error.message}"
  end
end

CSV.foreach(password_file) do |row|
  hash, count, prefix = row
  dynamodb_record = prepare_record(hash, prefix, count)
  send_to_dynamodb(dynamodb, dynamodb_record)
end
