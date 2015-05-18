json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :last_name, :eval_sum, :eval_amount
  json.url teacher_url(teacher, format: :json)
end
