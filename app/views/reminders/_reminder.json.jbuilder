json.extract! reminder, :id, :project_id, :start_date, :topic, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
