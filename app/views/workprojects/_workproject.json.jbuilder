json.extract! workproject, :id, :title, :details, :expected_completion_date, :tenant_id, :created_at, :updated_at
json.url workproject_url(workproject, format: :json)
