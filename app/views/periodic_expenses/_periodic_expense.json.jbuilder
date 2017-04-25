json.extract! periodic_expense, :id, :name, :period, :starts_at, :ends_at, :period_amount, :created_at, :updated_at
json.url periodic_expense_url(periodic_expense, format: :json)
