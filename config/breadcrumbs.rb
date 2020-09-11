crumb :root do
  link "Home", root_path
end

crumb :items_new do
  link "新規出品", new_item_path
  parent :root
end

crumb :items_show do |item|
  link item.item, item_path(item)
  parent :root
end

crumb :user_show do |user|
  link user.nickname, user_path(user)
  parent :root
end

crumb :items_purchase do |item|
  link "購入", item_orders_path(item)
  parent :items_show, item
end

crumb :items_edit do |item|
  link "編集", edit_item_path(item)
  parent :items_show, item
end

crumb :items_search do 
  link "詳細な検索", details_path
  parent :root
end