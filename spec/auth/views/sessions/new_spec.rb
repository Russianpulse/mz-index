require_relative '../../../../apps/auth/views/sessions/new'

RSpec.describe Auth::Views::Sessions::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/auth/templates/sessions/new.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
end
