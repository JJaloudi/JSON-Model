require "application_record"
class User < JSONRecords
  self.table_name = 'users'

  json_accessor :id
  json_accessor :email
  json_accessor :name
end
