json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :last_name, :sum_eval, :cant_eval
  json.url teacher_url(teacher, format: :json)
end
