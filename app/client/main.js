// console.log(`Greetings from ${module.id}!`);
// console.log('Olá Meteor, estou rodando no client')
import { Template } from 'meteor/templating'
import './main.html'
Meteor.startup(function(){
    sAlert.config({
        effect: '',
        // position: 'top-right',
        position: 'bottom',
        timeout: 5000
    })
})
Template.novoContato.events({
    'click #salvarContato'(event, instance){
        event.preventDefault();
        var form = {
            nome: $('input[name=nome]').val(),
            email: $('input[name=email]').val(),
            celular: $('input[name=celular]').val(),
            tipo: $('select[name=tipo]').val()
        }
        if (form.nome == ""){
            // alert('Ops. O nome deve ser preenchido.');
            // error = vermelho
            // success = verde
            // info = azul
            // warning = amarelo
            sAlert.warning('Ops. O nome deve ser preenchido.')
            return false;
        } else if (form.celular == "") {
            sAlert.info('Ops. O celular deve ser preenchido.');
            return false;
        } else if (form.tipo == null) {
            sAlert.info('Ops. Por favor selecione um tipo de contato.');
            return false;
        }
        Meteor.call('inserirContato', form, function(err, res){
            if(err){
                // console.log('Deu ruim... :(')
                // console.log(err.reason)
                sAlert.error(err.reason)
                return false;
            } else {
                sAlert.success('Contato cadastrado com sucesso.')
            }
        })
        // console.log(form)
    },
    'click #deleteContato'(event, instance) {
        // Deletar um contato
    }
});