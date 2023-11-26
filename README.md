# Chat Com Firebase

## Descrição

Projeto consiste em um chat onde possue algumas salas com alguns assusntos.

## Configuração

Certifique-se de ter o Flutter SDK instalado em sua máquina. Para mais informações sobre como instalar o Flutter, consulte [a documentação oficial do Flutter](https://flutter.dev/docs/get-started/install).

- [Firebase](https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=android): necessario efetuar os passos deste link gerando um projeto e um banco no firebase.

Fazendo os passos esses arquivos serão gerados
- google-services.json
- firebase_options.dart
- firebase_app_id_file.json

## Dependências

O projeto utiliza as seguintes dependências:

- [cupertino_icons](https://pub.dev/packages/cupertino_icons): Conjunto de ícones Cupertino para o estilo iOS.
- [firebase_core](https://pub.dev/packages/firebase_core): Configuração central do Firebase para Flutter.
  - Facilita a inicialização e configuração do Firebase no aplicativo.
- [cloud_firestore](https://pub.dev/packages/cloud_firestore): Cliente para o Firestore, o banco de dados NoSQL do Firebase.
  - Integração para acessar e manipular dados no Firestore.
- [shared_preferences](https://pub.dev/packages/shared_preferences): Persistência de dados simples e leve para Flutter.
  - Armazenamento local de dados simples, como preferências do usuário.
- [uuid](https://pub.dev/packages/uuid): Geração de UUIDs (identificadores únicos universais).
  - Utilizado para gerar identificadores únicos no aplicativo.
- [firebase_analytics](https://pub.dev/packages/firebase_analytics): Análise de eventos para o Firebase.
  - Integração com o Firebase para rastreamento de eventos.
- [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics): Relatórios de falhas e erros para o Firebase.
  - Integração com o Firebase para rastreamento de falhas e erros.
- [firebase_messaging](https://pub.dev/packages/firebase_messaging): Notificações push para o Firebase.
  - Suporte para notificações push utilizando o Firebase Cloud Messaging (FCM).
- [animated_text_kit](https://pub.dev/packages/animated_text_kit): Kit para animações de texto.
  - Adiciona animações de texto elegantes ao aplicativo.

### Dependências de Desenvolvimento

- [flutter_test](https://pub.dev/packages/flutter_test): Pacote de teste para Flutter.
  - Ferramentas para escrever e executar testes no Flutter.
- [build_runner](https://pub.dev/packages/build_runner): Ferramenta de construção para Flutter.
  - Utilizado para executar tarefas de build, como a geração de código.
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons): Geração de ícones para diferentes plataformas.
  - Simplifica a geração de ícones do aplicativo para diferentes plataformas.

## Configuração do `flutter_launcher_icons`

Certifique-se de executar o seguinte comando para gerar os ícones apropriados para o seu aplicativo:

```bash
dart run flutter_launcher_icons
