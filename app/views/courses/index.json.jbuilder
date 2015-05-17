json.array!(@courses) do |course|
  json.extract! course, :id, :name, :eval_sum, :eval_amount
  json.url course_url(course, format: :json)
end
