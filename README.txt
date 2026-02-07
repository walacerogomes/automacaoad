# Automação Active Directory - Desbloqueio e Reset de Senha 🛠️

Interface gráfica (GUI) desenvolvida em PowerShell para otimizar as operações de suporte do Centro de Atendimento ao Usuário (CAU) relacionadas com o Active Directory.

## 📝 Descrição
Este script centraliza as tarefas de desbloqueio de contas e reset de senhas numa interface visual intuitiva, eliminando a necessidade de navegar manualmente pelas Unidades Organizacionais do AD.

## ✨ Funcionalidades
- **Consulta em Tempo Real:** Valida a matrícula ou o ID do usuário e apresenta o Nome de Exibição do colaborador.
- **Desbloqueio de Conta:** Executa o `Unlock-ADAccount` com um único clique.
- **Reset de Senha Completo:** - Define a password padrão para `Mudar@123`.
  - Força a alteração da password no primeiro início de sessão.
  - Desbloqueia a conta simultaneamente.
- **Feedback Visual:** Alertas coloridos para utilizadores não encontrados ou operações concluídas.

## 🚀 Pré-requisitos
Para que o script funcione a 100% fora do servidor, a estação de trabalho deve cumprir os seguintes requisitos:

1. **RSAT Instalado:** É obrigatório ter as Ferramentas de Administração de Servidor Remoto (Remote Server Administration Tools) instaladas (especificamente o módulo de Usuários e Computadores do Active Directory).
2. **Privilégios de Administrador:** O utilizador que executa o script deve ter permissões delegadas no AD para realizar escrita e reset de passwords.
3. **Módulo Active Directory:** O PowerShell deve ter acesso ao módulo `ActiveDirectory`.

## ⚙️ Como Executar
Devido às políticas de execução padrão do Windows, recomenda-se executar o script através de um atalho ou terminal com o seguinte comando:

```powershell
powershell.exe -ExecutionPolicy Bypass -File "automacaoad.ps1"