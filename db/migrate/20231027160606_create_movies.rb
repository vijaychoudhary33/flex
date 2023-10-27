class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :director_name
      t.string :status
      t.string :genre
      t.string :language
      t.integer :run_time
      t.date :release

      t.timestamps
    end
  end
end
