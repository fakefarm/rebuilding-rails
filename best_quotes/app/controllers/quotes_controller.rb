class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :a_quote, :obj => quote_1
  end
  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth on k pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end
end
