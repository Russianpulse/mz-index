require_relative '../../../../apps/auth/views/sessions/destroy'

RSpec.describe Auth::Views::Sessions::Destroy do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/auth/templates/sessions/destroy.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
end
