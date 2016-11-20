json.extract! message_board, :id, :sender, :group_name, :message, :user_id, :group_id, :created_at, :updated_at
json.url message_board_url(message_board, format: :json)