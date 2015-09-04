# See https://github.com/voltrb/volt#routes for more info on routes

client '/', controller: 'main'
client '/examples', controller: 'examples', action: 'index'
client '/examples/{{ category }}/{{ example }}', controller: 'examples', action: 'example'

# The main route, this should be last. It will match any params not
# previously matched.
client '/', {}
