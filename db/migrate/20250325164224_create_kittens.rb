class CreateKittens < ActiveRecord::Migration[8.0]
  def change
    create_table :kittens do |t|
      t.string :name
      t.integer :age
      t.string :cuteness
      t.integer :softness

      t.timestamps
    end
  end
end
