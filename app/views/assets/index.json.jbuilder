json.array!(@assets) do |asset|
  json.extract! asset, :id, :category_id, :code, :name, :author, :author_sort, :subject, :kind, :format, :pages, :publisher, :published_date, :language, :isbn_10, :isbn_13, :rights, :tags, :excerpt, :rating, :notes, :created_by, :updated_by
  json.url asset_url(asset, format: :json)
end
