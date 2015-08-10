class FileTask < Volt::Task
  def read_files
    main_rbs = Hash.new
    
    Dir.foreach("opal-phaser-examples/examples") do |category|
      next if category == "." || category == ".." || category == "assets"
      Dir.foreach("opal-phaser-examples/examples/#{category}") do |example_dir|
        next if example_dir == "." || example_dir == ".."
        main_rb = File.open("opal-phaser-examples/examples/#{category}/#{example_dir}/main.rb")
        main_rb_content = main_rb.read
        main_rb.close
        
        main_rbs[example_dir] = main_rb_content
      end
    end
    
    main_rbs
  end
end