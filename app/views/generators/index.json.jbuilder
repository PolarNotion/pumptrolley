json.array!(@generators) do |generator|
  json.extract! generator, :id, :name, :is_private, :author_id
  json.url generator_url(generator, format: :json)
end
