json.array!(@prof_pics) do |prof_pic|
  json.extract! prof_pic, :name, :description, :picture
  json.url prof_pic_url(prof_pic, format: :json)
end
