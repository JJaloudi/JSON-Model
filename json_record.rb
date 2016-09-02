class JSONRecords < ActiveRecord::Base
  @json_keys = {:key => "test"}
  class << self
    attr_accessor :json_keys

    def json_accessor(j_attr, options={})
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
      hash[key] = instance_eval ("#{key.to_s}")
    end

    return hash
  end
end
