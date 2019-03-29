class AddCategoriesNullCheck < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:categories, :body, false)
  end
end
