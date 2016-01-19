json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :name, :content, :followup_content, :tags, :registration_url, :documentation_url, :is_private, :parent_id, :author_id
  json.url snippet_url(snippet, format: :json)
end
