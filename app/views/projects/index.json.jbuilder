json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :status, :date_to
  json.url project_url(project, format: :json)
end
