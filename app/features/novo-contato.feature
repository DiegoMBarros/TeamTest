#language: pt

Funcionalidade: Novo Contato
    Sendo um usuario 
    Posso realizar um novo cadastro
    Para poder gerenciar minha rede de contatos

    @sprint1 @insert_contato
    Esquema do Cenario: Novo contato

        # Dado que "<nome>" é meu novo contato
        # E este contato possui os seguintes dados:
        Dado que possuo o seguinte contato
            | nome    | <nome>    |
            | email   | <email>   |
            | celular | <celular> |
            | tipo    | <tipo>    |
        Quando faço o cadastro deste novo contato
        Então devo ver a mensagem de alerta "Contato cadastrado com sucesso."
        # E este contato deve ser inserido no banco de dados

        Exemplos:
        |nome        |email          |celular   |tipo     |
        |Wade Wilson |wade@marvel.com|1199991001|Whats    |
        |Tony Stark  |tonny@stark.com|1199991002|Telegram |
        |Steve Rogers|rogers@aol.com |1199991003|SMS      |
        |Bruce Banner|               |1199991004|SMS      |

    @sprint2
    Esquema do Cenário: Campos obrigatórios

        # Dado que "<nome>" é meu novo contato
        # E este contato possui os seguintes dados:
        Dado que possuo o seguinte contato
            | nome    | <nome>    |
            | celular | <celular> |
            | tipo    | <tipo>    |
        Quando faço o cadastro deste novo contato
        Então devo ver a mensagem de alerta "<mensagem>"
        E este contato não deve ser inserido no banco de dados

        Exemplos:
        |nome        |celular   |tipo     |mensagem                                   |
        |            |1199991005|Whats    |Ops. O nome deve ser preenchido.           |
        |Peter Parker|          |Telegram |Ops. O celular deve ser preenchido         |
        |Scott Lang  |1199991006|         |Ops. Por favor selecione um tipo de contato|


    Cenario: Celular não pode ser duplicado
        Dado que possuo o seguinte contato
            | nome    | Fernando Papito |
            | email   | eu@papito.io    |
            | celular | 11946800923     |
            | tipo    | Whats           |
        Mas eu já existe um contato com este celular
        Quando faço o cadastro deste novo contato
        Então devo ver a mensagem de alerta "Celular já cadastrado para outro contato."