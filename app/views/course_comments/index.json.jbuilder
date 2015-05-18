json.array!(@course_comments) do |course_comment|
  json.extract! course_comment, :id, :content
  json.url course_comment_url(course_comment, format: :json)
end
