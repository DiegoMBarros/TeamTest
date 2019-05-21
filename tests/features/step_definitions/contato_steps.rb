Dado('que {string} é meu novo contato') do |nome|
  @nome = nome
end

Dado('este contato possui os seguintes dados:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('faço o cadastro deste novo contato') do
  visit 'http://localhost:8080/form-novo.html'
end

Então('devo ver a seguinte mensagem de sucesso {string}') do |mensagem|
  pending # Write code here that turns the phrase above into concrete actions
end
