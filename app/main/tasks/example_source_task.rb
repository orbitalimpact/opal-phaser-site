class ExampleSourceTask < Volt::Task
  def read_source_files
    main_rbs = Hash.new
    
    Dir.foreach("opal-phaser-examples/examples") do |category|
      next if category == "." || category == ".." || category == "assets"
      Dir.foreach("opal-phaser-examples/examples/#{category}") do |example|
        next if example == "." || example == ".."
        main_rb         = File.open("opal-phaser-examples/examples/#{category}/#{example}/main.rb")
        main_rb_content = main_rb.read
        main_rb.close
        
        main_rbs[example] = main_rb_content
      end
    end
    
    main_rbs
  end
end