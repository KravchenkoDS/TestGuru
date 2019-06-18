class AddSuccessToPassedTests < ActiveRecord::Migration[5.2]
  def change
    add_column :passed_tests, :success, :boolean, default: false, null: false
  end
end
