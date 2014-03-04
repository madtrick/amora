guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|coffee|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

guard 'minitest', spring: 'rake test', all_on_start: false do
  watch(%r{^test/test_helper/.+.rb}) { 'test' }
  watch(%r{^test/test_helper\.rb})   { 'test' }
  watch(%r{^test/.+_test\.rb})
  watch(%r{^app/(.+)\.rb})                               { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^app/controllers/application_controller\.rb}) { 'test/controllers' }
  watch(%r{^lib/(.+)\.rb})                               { |m| "test/lib/#{m[1]}_test.rb" }
end
