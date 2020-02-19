module CategoriesHelper
  def navList(category)
    nav = [
      {name: "FURIMA", path: "/"},
      {name: "カテゴリー一覧", path: "/categories"}
    ]

    unless category.nil?
      if category.parent
        parent = category.parent
        parent_data = {name: parent.name, path: "/categories/#{parent.id}"}
        if parent.parent
          grand_parent = parent.parent
          grand_parent_data = {name: grand_parent.name, path: "/categories/#{grand_parent.id}"}
          nav << grand_parent_data
        end
        nav << parent_data
      end
      nav << {name: category.name, path: "/categories/#{category.id}"}
    end
    nav
    end
end
