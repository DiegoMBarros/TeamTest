#language: pt

Funcionalidade: Novo Contato
    Sendo um usuario 
    Posso realizar um novo cadastro
    Para poder gerenciar minha rede de contatos

    Cenario: Novo contato

        Dado que "<nome>" é meu novo contato
        E este contato possui os seguintes dados:
            |email  |<email>  |
            |celular|<celular>|
            |tipo   |<tipo>   |
        Quando faço o cadastro deste novo contato
        Então devo ver a seguinte mensagem de sucesso "Contato cadastrado com sucesso."

        Exemplos:
        |nome        |email          |celular   |tipo     |
        |Wade Wilson |wade@marvel.com|1199991001|Whats    |
        |Tony Stark  |tonny@stark.com|1199991002|Telegram |
        |Steve Rogers|rogers@aol.com |1199991003|SMS      |
        |Bruce Barner|               |1199991004|SMS      |

    Cenário: Campos obrigatórios

        Dado que "<nome>" é meu novo contato
        E este contato possui os seguintes dados:
            |celular|<celular>|
            |tipo   |<tipo>   |
        Quando faço o cadastro deste novo contato
        Então devo ver a seguinte "<mensagem>" de alerta

        Exemplos:
        |nome        |celular   |tipo     |mensagem                                   |
        |            |1199991001|Whats    |Ops. O nome deve ser preenchido            |
        |Peter Parker|          |Telegram |Ops. O celular deve ser preenchido         |
        |Scott Lang  |1199991003|         |Ops. Por favor selecione um tipo de contato|

