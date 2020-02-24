json.array! @childform do |childform|
  json.id childform.id
  json.name childform.name
end

json.array! @grandhchildform do |grandchildform|
  json.id grandchildform.id
  json.name grandchildform.name
end