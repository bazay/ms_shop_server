class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets, &:timestamps
  end
end
