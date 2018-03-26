class AddStatusToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :status, :string

    reversible do |dir|
      dir.up do
        execute <<~EOT
          UPDATE comments
          SET status = 'draft'
        EOT
      end
    end
  end
end
