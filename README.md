# README

Projeto criado para o [desafio da Vagas.com](CHALLENGE.md)

## Instalação

### Instale as dependencias

```shell
$ bundle
```

### Inicialize o banco

```shell
$ rails db:create db:migrate db:seed
```

## Testes

Para rodas todos os testes:
```shell
$ rspec
```

## Considerações

- Para o calculo da distancia foi implementado o algoritmo de Dijkstra.
- Foi criado o concern ExperienceLevel para o comportamento de Níveis de experiência das classes Person e JobOpportunity
- Tratamentos de erros comum a todas as controllers foram adicionados a ApplicationController

## Melhorias

- Usar fila com prioridade para o algoritmo de Dijkstra para melhorar a performance.
- Criar a entidade Company para relacionar as vagas, e ter uma visão de todas as vagas de uma determinada empresa.
- Usar shared_context para os testes [job_application_spec](spec/models/job_application_spec.rb).


## Gems adicionadas

 - [rspec-rails](https://github.com/rspec/rspec-rails) substitui o framework de teste padrão por rspec
 - [rspec-json_expectations](https://github.com/waterlink/rspec-json_expectations) matchers para json, usado para testar as repostas da api 
 - [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) usada para definir e criar entidades de forma mais simples, usado para testes
 - [faker](https://github.com/faker-ruby/faker) usada para criar dados para as entidades de forma dinamica

## Referencias

 - https://en.wikipedia.org/wiki/Dijkstra's_algorithm
 - https://www.youtube.com/watch?v=ovkITlgyJ2s
