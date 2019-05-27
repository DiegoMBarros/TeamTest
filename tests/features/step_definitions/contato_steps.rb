Dado('que {string} é meu novo contato') do |nome|
  @nome = nome
end

Dado('este contato possui os seguintes dados:') do |table|
 @dados_contato = table.rows_hash
end

Quando('faço o cadastro deste novo contato') do
  visit 'http://localhost:8080/form-novo.html'

  #fill_in só funciona com 'id'
  fill_in 'nome', with: @nome
  #find('#nome').set @nome
  fill_in 'email', with: @dados_contato[:email]
  fill_in 'celular', with: @dados_contato[:celular]

  tipo_contato = find('#tipo')
  tipo_contato.find('option', text: @dados_contato[:tipo]).select_option

  click_on 'Cadastrar'
end

Então('devo ver a seguinte mensagem de sucesso {string}') do |mensagem|
  expect(page).to have_content mensagem
end
