class FileTask < Volt::Task
  def read_files
    example_files = Hash.new
    
    Dir.foreach("app/examples/lib") do |category|
      next if category == "." || category == ".."
      Dir.foreach("app/examples/lib/#{category}") do |file|
        next if file == "." || file == ".."
        example_file = File.open("app/examples/lib/#{category}/#{file}")
        file_value   = example_file.read
        example_file.close
        
        file_key = file.sub(".rb", "")
        example_files[file_key] = file_value
      end
    end
    
    example_files
  end
end