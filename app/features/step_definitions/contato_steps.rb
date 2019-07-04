# Dado('que {string} é meu novo contato') do |nome|
#   @nome = nome
# end

# Dado('este contato possui os seguintes dados:') do |table|
#   @dados_contato = table.rows_hash
# end

Dado('que possuo o seguinte contato') do |table|
  @novo_contato = table.rows_hash
end

Quando('faço o cadastro deste novo contato') do
  # visit 'http://localhost:8080/form-novo.html'
  visit 'http://localhost:3000'
  #fill_in só funciona com 'id'
  # fill_in 'nome', with: @nome
  #find('#nome').set @nome
  fill_in 'nome', with: @novo_contato[:nome]
  fill_in 'email', with: @novo_contato[:email]
  fill_in 'celular', with: @novo_contato[:celular]

  if @novo_contato[:tipo] !=''
    tipo_contato = find('#tipo')
    tipo_contato.find('option', text: @novo_contato[:tipo]).select_option
  end

  click_on 'Cadastrar'
end

Então('devo ver a mensagem de alerta {string}') do |mensagem|
  alert = find('.s-alert-box')
  expect(alert).to have_content mensagem
end

# Então('este contato deve ser inserido no banco de dados') do
#   # require 'mongo'
#   # Mongo::Logger.logger = Logger.new('log/mongo.log')
#   # client = Mongo::Client.new('mongodb://127.0.0.1:3001/meteor')
#   # contatos = client[:contatos]

#   # # collection.find( { name: 'Sally' } ).first #comando tirado do site da documentação do mongo 'https://docs.mongodb.com/ruby-driver/master/quick-start/'
#   # res = contatos.find('celular' => @novo_contato[:celular]).first

#   res = DAO.new.busca_por_celular(@novo_contato[:celular])

#   expect(res[:nome]).to eql @novo_contato[:nome]
#   expect(res[:email]).to eql @novo_contato[:email]
#   expect(res[:celular]).to eql @novo_contato[:celular]
#   expect(res[:tipo]).to eql @novo_contato[:tipo]
# end

Então('este contato não deve ser inserido no banco de dados') do
  # require 'mongo'
  # Mongo::Logger.logger = Logger.new('log/mongo.log')
  # client = Mongo::Client.new('mongodb://127.0.0.1:3001/meteor')
  # contatos = client[:contatos]

  # res = contatos.find('celular' => @novo_contato[:celular]).first

  res = DAO.new.busca_por_celular(@novo_contato[:celular])

  expect(res).to be_nil
end
# Então('devo ver a seguinte mensagem de sucesso {string}') do |mensagem|
#   # expect(page).to have_content mensagem
#   # Como a mensagem será exibida em uma pop-up, o comando para pegar o alert do javascript é o:
#   alert = page.driver.browser.switch_to.alert.text
#   expect(alert).to eql mensagem
#   page.driver.browser.switch_to.alert.accept
# end

# Então("devo ver a seguinte {string} de alerta") do |mensagem|
#   alert = page.driver.browser.switch_to.alert.text
#   expect(alert).to eql mensagem
# end
