# 🚀 Automação de Convites - FestaLab

Projeto de automação de testes End-to-End (E2E) desenvolvido com **Robot Framework** e **SeleniumLibrary** para validar o fluxo completo de criação de convites na plataforma FestaLab.

## 📋 Sobre o Projeto
O robô realiza a jornada completa do usuário, garantindo a integridade das seguintes funcionalidades:
- **Personalização:** Escolha de artes e preenchimento de dados do evento (nome, data, endereço).
- **Autenticação:** Fluxo de Login com usuários cadastrados.
- **Upload de Mídia:** Inserção de fotos personalizadas no convite.
- **Resiliência:** Validação visual da conclusão do convite com espera dinâmica de até 1 minuto.

## 🛠️ Tecnologias e Boas Práticas
- **Linguagem:** [Python](https://www.python.org/)
- **Framework:** [Robot Framework](https://robotframework.org/)
- **Biblioteca:** [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- **Padrão de Projeto:** Page Object Model (POM) simplificado através de `resources`.
- **Clean Code:** Uso de keywords personalizadas para eliminar repetições e `Sleeps` desnecessários.

## 📂 Estrutura de Pastas
- `resources/`: Keywords e seletores mapeados (`keywords.robot`).
- `tests/`: Scripts de teste estruturados (`fluxo_convite.robot`).
- `tests/images/`: Massa de dados (imagens) para testes de upload.
- `.gitignore`: Configuração para não versionar arquivos temporários e relatórios locais.

## 🚀 Como Executar
1. Certifique-se de ter o Python instalado.
2. Instale as dependências:
   ```bash
   pip install robotframework robotframework-seleniumlibrary

   Execute o teste: robot -d ./results tests/fluxo_convite.robot

   ### 3. Salvar o arquivo
Não esqueça de dar um **Ctrl + S** para salvar as alterações no VS Code.

---

### E agora, como mando para o GitHub?
Agora que o README está bonitão, você vai usar aqueles comandos de terminal que conversamos:

1. No terminal do VS Code: `git add .` (isso vai incluir o novo README).
2. `git commit -m "docs: atualiza README com documentação profissional"`
3. E por fim: `git push -u origin principal`

**Dica:** Depois que você der o `push`, atualize a página do seu navegador no GitHub. Você verá que o texto que você colou aparecerá formatado com títulos, negritos e blocos de código!

**Quer que eu te ajude com mais algum detalhe no texto antes de você subir?**
