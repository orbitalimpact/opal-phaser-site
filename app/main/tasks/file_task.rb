class FileTask < Volt::Task
  def read_files
    example_files = Hash.new
    
    Dir.foreach("opal-phaser-examples/examples") do |category|
      next if category == "." || category == ".." || category == "assets"
      Dir.foreach("opal-phaser-examples/examples/#{category}") do |example|
        next if example == "." || example == ".."
        example_file = File.open("opal-phaser-examples/examples/#{category}/#{example}/main.rb")
        file_content   = example_file.read
        example_file.close
        
        example_files[example] = file_content
      end
    end
    
    example_files
  end
end