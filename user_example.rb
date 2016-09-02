require "application_record"
class User < JSONRecords
  self.table_name = 'users'

  #Use json_accessor :variable_name_from_object to supply your class with the information necessary.
  json_accessor :id
  json_accessor :email
  json_accessor :name
end
