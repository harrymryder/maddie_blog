class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :photo

      t.timestamps
    end
  end
end
