# Localiza CEP

Buscador de CEPs desenvolvido em Dart e Flutter para um projeto da trilha de
aprendizado de Flutter oferecida pelo Santander através da plataforma [DIO](https://www.dio.me/sign-in).

![Dart](https://img.shields.io/badge/dart-%232566E9.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%232566E9.svg?style=for-the-badge&logo=Flutter&logoColor=white)

![Ícone e telas do app](./docs/img/capa.jpg)

## Funcionalidades

### Pesquisa de CEP

- O app permite a busca de informações a respeito de um CEP, para isso ele utiliza a API [ViaCEP](https://viacep.com.br/)
- Caso alguma das informações não esteja disponível para aquele CEP, um traço (`-`) é exibido para demonstrar a ausência da informação
- As informações exibidas são as seguintes:
   - Endereço
   - Bairro
   - Cidade
   - Estado (em formato de sigla)
   - DDD

### Salvamento de CEPs

- O app permite que você salve seus CEPs favoritos para consulta posterior, para isso ele usa o backend de uma aplicação oferecida pelo [Back4App](https://www.back4app.com/)
- Os CEPs salvos são movidos para a guia "CEPs Salvos", e são exibidos em formato de lista
- Na visualização de lista é exibido a cidade e estado aos quais aquele CEP se refere, bem como o próprio CEP
- Clicando em um item da lista de CEPs salvos uma nova tela é aberta na qual são exibidas todas as informações referentes aquele item
- Para remover um CEP salvo basta deslizar o item da direita para a esquerda e confirmar a exclusão

## Executando o projeto

Para executar o projeto você precisa ter o [Flutter](https://flutter.dev/)
instalado em sua máquina.

Esse passo a passo explica como executar o projeto via [VS Code](https://code.visualstudio.com/).

1. Abra a pasta do projeto no terminal

2. Execute o comando a seguir para instalar as dependências do projeto

   ```bash
   flutter pub get
   ```

3. Abra o projeto no VS Code e instale a [extensão Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

4. Vá até o site [Bak4App](https://www.back4app.com/) e crie uma conta

5. Estando logado em sua conta, crie um novo app

6. Após a criação do app crie uma nova classe chamada CEP e adicione os campos
conforme os tipos indicados a seguir:

   ```typescript
    cep: string
    logradouro: string
    complemento: string
    bairro: string
    localidade: string
    uf: string
    ddd: string
   ```

7. Na tela de dashboard do seu app, navegue usando a barra lateral até a opção
`API` > `API Reference`

8. Na tela que abrirá navegue até a seção `CEP Class API`, em seguida role a
página até chegar na área intitulada `Creating Objects`

9. Role até encontrar a subseção `Headers`, em seguida copie o valor indicado em
`X-Parse-Application-Id` e o cole no primeiro campo do arquivo `.env`

10. Copie o valor indicado em `X-Parse-REST-API-Key` e cole no segundo campo do
arquivo `.env`

11. Abra o projeto flutter no VS Code e vá até a área inferior direita,
selecione o dispositivo em que você deseja executar a aplicação

12. Abra o arquivo `lib/main.dart` e aperte o botão play na área superior direita
