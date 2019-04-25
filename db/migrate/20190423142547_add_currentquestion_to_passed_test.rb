class AddCurrentquestionToPassedTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :passed_tests,:current_question, foreign_key: { to_table: :questions }
  end
end