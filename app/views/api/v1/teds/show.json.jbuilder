json.extract! @ted, :id, :name, :user, :rank, :distance_traveled
json.chapter @ted.chapters do |chapter|
  json.extract! chapter, :id, :user, :description, :localisation, :likes , :country
  json.photo chapter.photos do |photo|
    json.extract! photo, :title, :description
  end
end


