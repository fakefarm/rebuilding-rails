require 'erubis'

template = <<TEMPLATE
Hello! this is a template!
It has <%= whatever %>,
TEMPLATE

eruby = Erubis::Eruby.new(template)
puts eruby.src
puts "========"
puts eruby.result(:whatever => 'sleepness.')
