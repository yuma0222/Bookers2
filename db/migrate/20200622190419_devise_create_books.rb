class DeviseCreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      ## Database authenticatable
      t.string :title
      t.string :body
      t.string :image

      t.timestamps
    end
  end
end