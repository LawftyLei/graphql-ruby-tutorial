class RecordLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def perform(ids)
    begin
      records = @model.where(id: ids).index_by(&:id)
      p records
      ids.each do |id|
        record = records[id]
        fulfill(id, record) if record
      end
    rescue StandardError => e
      # Handle errors appropriately, reject the promises with an error
      ids.each { |id| reject(id, e) unless fulfilled?(id) }
    end
  end
end
