class UserLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def perform(ids)
    records = @model.where(user_id: ids).group_by(&:user_id)
    ids.each do |id|
      record = records[id]
      fulfill(id, record) if record
    end
  end
end
