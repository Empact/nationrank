group 'dev' do
  guard 'bundler' do
    watch('Gemfile')
  end

  # guard 'resque', environment: 'development' do
  #   watch(%r{^app/jobs/(.+)\.rb$})
  #   watch(%r{^app/models/(.+)\.rb$})
  #   watch(%r{^lib/(.+)\.rb$})
  # end

  # guard 'sunspot', environment: 'development' do
  #   watch('Gemfile.lock')
  #   watch('config/sunspot.yml')
  # end
end

group 'test' do
  # guard 'sunspot', environment: 'test' do
  #   watch('Gemfile.lock')
  #   watch('config/sunspot.yml')
  # end

  guard 'spork' do
    watch('config/application.rb')
    watch('config/environment.rb')
    watch(%r{^config/environments/.+\.rb$})
    watch(%r{^config/initializers/.+\.rb$})
    watch('Gemfile')
    watch('Gemfile.lock')
    watch('spec/spec_helper.rb') { :rspec }
    %w[support factories fixtures].each do |folder|
      watch(%r{spec/#{folder}/.+\.rb}) { :rspec }
    end
  end
end

group 'autotest' do
  guard 'rspec', cli: '--drb' do
    watch('spec/spec_helper.rb')                        { "spec" }
    watch('app/controllers/application_controller.rb')  { "spec/controllers" }
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb" }
    # watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  end
end
