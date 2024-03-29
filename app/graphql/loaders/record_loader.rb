class RecordLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def perform(ids)
    records = @model.where(id: ids).index_by(&:id)
    ids.each do |id|
      record = records[id]
      fulfill(id, record) if record
    end
  end
end
