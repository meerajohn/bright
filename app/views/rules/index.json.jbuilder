json.array!(@rules) do |rule|
  json.extract! rule, :id, :category_id, :membership_id, :mnemonic, :name, :value
  json.url rule_url(rule, format: :json)
end
