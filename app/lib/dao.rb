#NOSQL => MongoDB não relacional, desnormalizado
# Ao invés de Table, teremos Collection
# Ao invés de Register teremos Document
require 'mongo'
#limpar a collection
client = Mongo::Client.new('mongodb://127.0.0.1:3001/meteor')
#Ou assim client = Mongo::Client.new('mongodb://localhost:3001/meteor') (127.0.0.1 é o endereço de ip do localhost)
contatos = client[:contatos]
contatos.delete_many