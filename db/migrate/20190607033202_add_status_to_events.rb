class AddStatusToEvents < ActiveRecord::Migration[5.1]
  def change
    # add a field "status" in table "events", type is string
    add_column :events, :status, :string
  end
end
