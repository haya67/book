class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :check_in
      t.string :check_out
      t.string :people
      t.string :total
      t.bigint :price

      t.timestamps
    end
  end
end
