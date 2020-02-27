module ItemsHelper
  # edit
  def categoryParents(item)
    categories = @item.category.root.siblings
  end

  def categoryChildren(item)
    categories = @item.category.parent.parent.children
  end

  def categoryGrandChildren(item)
    categories = @item.category.parent.children
  end
end