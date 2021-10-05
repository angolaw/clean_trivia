#narrativa
Feature: Login
Como um cliente 
Quero poder acessar minha conta e me manter logado
Para que eu possa ver e responder enquetes de forma rapida

#criterio de aceitacao
Cenário: Credenciais válidas
Dado que o cliente informou credenciais válidas
Quando solicitar pra fazer login
Então o sistema deve enviar o usuário para a tela de enquetes 
E manter o usuário conectado

Cenário: Credenciais inválidas
Dado que o cliente informou credenciais inválidas
Quando solicitar pra fazer login
Então o sistema deverá retornar uma mensagem de erro.