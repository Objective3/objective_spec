module Spec
  module Rails
    module Example
      # Mailer examples live in $RAILS_ROOT/spec/mailers/.
      #
      # Mailer examples use Spec::Rails::Example::MailerExampleGroup, which
      # provides support for fixtures and some custom expectations via extensions
      # to ActiveRecord::Base.
      class MailerExampleGroup < ActiveSupport::TestCase
        Spec::Example::ExampleGroupFactory.register(:mailer, self)
      end
    end
  end
end
