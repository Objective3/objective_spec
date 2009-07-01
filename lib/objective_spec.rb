# Ensure the spec directory is on the Load Path
$: << File.join(Rails.root, 'spec')

require 'objective_spec/mailer_example_group'
require 'objective_spec/matchers'
require 'objective_spec/spec_helpers'
require 'objective_spec/disconnected'
