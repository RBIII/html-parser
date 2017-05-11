class CreatePage < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :url, null: false, unique: true
      t.text :h1s, array: true, default: []
      t.text :h2s, array: true, default: []
      t.text :h3s, array: true, default: []
      t.text :links, array: true, default: []

      t.timestamps
    end
  end
end
