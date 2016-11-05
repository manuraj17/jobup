json.extract! job, :id, :title, :description, :location, :company, :created_at, :updated_at
json.extract! user, :id, :email, :name
json.url job_url(job, format: :json)
