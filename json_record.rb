class JSONRecords < ActiveRecord::Base
  #Create initial json_keys hash. This hash contains the variable name and options required to return the json necessary.
  @json_keys = {:key => "test"}
  class << self
    attr_reader :json_keys

    #Options haven't been implemented yet, but will be in future updates.
    def json_accessor(j_attr, options={})
      #If the class hasn't defined a json_keys hash, we'll do it for you!
      if self.json_keys == nil
        self.json_keys = {}
      end
      json_keys[j_attr] = options

      puts "key added #{j_attr.to_s}, tbl: #{json_keys}"
    end
  end

  def json!
    hash = {}

    self.class.json_keys.each do |key, val|
      #Convert the key to a string and use that to gain access to the instances variable.
      hash[key] = instance_eval ("#{key.to_s}")
    end

    return hash
  end
end
