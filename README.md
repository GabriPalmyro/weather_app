# Flutter Weather App

## Descrição

O Flutter Weather App é um aplicativo móvel de previsão do tempo intuitivo e fácil de usar que fornece informações meteorológicas precisas para a localização atual do usuário, bem como permite a busca por previsões em outras localidades. Este projeto foi desenvolvido utilizando o Flutter e segue princípios de Clean Architecture para garantir uma estrutura de código sustentável e escalável.

## Características

- **Previsão do Tempo na Localização Atual**: Exibe a previsão do tempo detalhada para a localização atual do usuário, incluindo temperatura, umidade, pressão, velocidade do vento, e mais.
- **Buscar Localidades**: Permite aos usuários buscar previsões do tempo para diferentes localidades pelo nome da cidade.
- **Design Responsivo**: Adaptável a diferentes tamanhos de tela e orientações.
- **Clean Architecture**: Estruturado com base nos princípios de Clean Architecture para facilitar a manutenção e a expansão do código.

## Tecnologias Utilizadas

- **Flutter**: Framework para o desenvolvimento de interfaces de usuário para mobile, web e desktop a partir de uma base de código única.
- **Dart**: Linguagem de programação otimizada para aplicativos multiplataforma, usada pelo Flutter.
- **API de Previsão do Tempo**: Integração com uma API externa para obter dados de previsão do tempo.
- **Injeção de Dependencia com GetIt**: Uso do package GetIt para fazer a injeção de dependência da Aplicação.

## Design de Inspiração (Dribble)
![Design](/assets/images/design.jpg)

## Como Começar

Para rodar este projeto localmente, siga os passos abaixo:

### Pré-requisitos

- Flutter (versão mais recente recomendada)
- Dart (versão compatível com o Flutter instalado)
- Android Studio ou VS Code com extensões do Flutter e Dart instaladas
- Emulador Android/iOS ou dispositivo físico

### Instalação

1. Clone o repositório do projeto:

```bash
git clone https://github.com/GabriPalmyro/weather_app.git
```

2. Navegue até a pasta do projeto:

```bash
cd weather_app
```

3. Execute o seguinte comando para instalar todas as dependências necessárias:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Inicie o emulador ou conecte seu dispositivo físico.

5. Execute o aplicativo:

```bash
flutter run
```

## Estrutura do Projeto

Este projeto segue os princípios de Clean Architecture, organizando o código em camadas de Responsabilidade, Domínio, Dados e Apresentação.

- `lib/`
  - `app/`: Configurações do App
    - `commons/`: Padrões e abstrações de packages comuns entre telas
    - `di/`: Dependency Injection do App
    - `packages/`: Packages com todas as funções do App
        - `feature/`:
            - `data/`:
            - `di/`:
            - `domain/`:
            - `presentation/`:
                - `cubit/`:
                - `pages/`:
                - `widgets/`:
    - `utils/`: Utilidades do App
  - `main.dart`: Arquivo principal

## Contribuindo

Contribuições são sempre bem-vindas! Se você tem alguma sugestão para melhorar este aplicativo, sinta-se à vontade para fazer um fork do repositório e enviar um pull request, ou simplesmente abrir uma issue.

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.

---

Sinta-se à vontade para ajustar o conteúdo conforme necessário para se adequar às especificidades do seu projeto, como adicionar detalhes sobre a API de previsão do tempo utilizada, instruções mais específicas de instalação e configuração, ou informações adicionais sobre como contribuir para o projeto.