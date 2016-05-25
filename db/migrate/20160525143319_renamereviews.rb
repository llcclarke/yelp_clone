class Renamereviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.rename :thoughs, :thoughts
    end
  end
end
