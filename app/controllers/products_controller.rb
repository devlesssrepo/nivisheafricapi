class ProductsController < JSONAPI::ResourceController
  def upload
    uploaded_io = params[:data][attributes:[:pictures]]
    File.open(Rails.root.join('public','uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
    end
  end
end