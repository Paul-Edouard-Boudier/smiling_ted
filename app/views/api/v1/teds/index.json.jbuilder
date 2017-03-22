json.array! @teds do |ted|
  json.extract! ted, :id, :name, :user, :rank, :distance_traveled
end
