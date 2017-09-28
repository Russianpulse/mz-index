require_relative '../../../../apps/auth/views/sessions/create'

RSpec.describe Auth::Views::Sessions::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/auth/templates/sessions/create.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
end
