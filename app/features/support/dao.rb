require 'mongo'

class DAO
  def busca_por_nome(nome)
    contatos.find('nome' => nome).first
  end

  def busca_por_celular(celular)
    # Mongo::Logger.logger = Logger.new('log/mongo.log')
    # client = Mongo::Client.new('mongodb://127.0.0.1:3001/meteor')
    # contatos = client[:contatos]
    #No Ruby a última instrução do método retorna o resultado automaticamente
    contatos.find('celular' => celular).first
  end

  def delete_por_celular(celular)
    contatos.delete_many('celular' => celular)
  end

  private
  def conecta
    Mongo::Logger.logger = Logger.new('log/mongo.log')
    Mongo::Client.new('mongodb://127.0.0.1:3001/meteor')
  end

  def contatos
    client[:contatos]
  end
end