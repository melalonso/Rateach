json.array!(@teacher_comments) do |teacher_comment|
  json.extract! teacher_comment, :id, :content
  json.url teacher_comment_url(teacher_comment, format: :json)
end
