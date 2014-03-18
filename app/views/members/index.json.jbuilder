json.array!(@members) do |member|
  json.extract! member, :id, :membership_id, :code, :name, :kind, :gender, :age_group, :notes, :created_by, :updated_by
  json.url member_url(member, format: :json)
end
