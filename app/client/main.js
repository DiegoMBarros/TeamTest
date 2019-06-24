// console.log(`Greetings from ${module.id}!`);
// console.log('Olá Meteor, estou rodando no client')
import { Template } from 'meteor/templating'
import './main.html'
Template.novoContato.events({
    'click #salvarContato'(event, instance){
        event.preventDefault();
        var form = {
            nome: $('input[name=nome]').val(),
            email: $('input[name=email]').val(),
            celular: $('input[name=celular]').val(),
            tipo: $(select[name=tipo]).val()
        }
        if (form.nome == ""){
            alert('Ops. O nome deve ser preenchido.');
            return false;
        } else if (form.celular == "") {
            alert('Ops. O celular deve ser preenchido.');
            return false;
        } else if (form.tipo == null) {
            alert('Ops. Por favor selecione um tipo de contato.');
            return false;
        }
        Meteor.call('inserirContato', form, function(err, res){
            if(err){
                console.log('Deu ruim... :(')
                return false;
            } else {
                alert('Contato cadastrado com sucesso.')
            }
        })
        // console.log(form)
    },
    'click #deleteContato'(event, instance) {
        // Deletar um contato
    }
});